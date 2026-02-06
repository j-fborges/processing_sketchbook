// constants for simulation
const GRID_NUM = 50;
const GRID_SIZE = 0.1;
const MAX_FORCE = 200.0;
const FORCE_SCALE = 50.0;
const FORCE_RANGE = 0.5;
const ATTENUATION_RATE = 0.995;
const TIME_SCALE = 1.5;

// for debugs
const RENDER_VELOCITIES = false;
const RENDER_VELOCITIES_CLAMP_VALUE = 1.0;

// variables for simulations
let colors;
let velocities;
let lastSeconds;

// variables for rendering
let gridStep;

function setup() {
  createCanvas(500, 500);
  initialize();
}

function keyPressed() {
  initialize();
}

function initialize() {
  colors = new Array(GRID_NUM + 1);
  velocities = new Array(GRID_NUM + 1);
  const colorFunc = getInitialColorFunction();
  for(let xi = 0; xi < GRID_NUM + 1; xi++) {
    colors[xi] = new Array(GRID_NUM + 1);
    velocities[xi] = new Array(GRID_NUM + 1);
    for (let yi = 0; yi < GRID_NUM + 1; yi++) {
      colors[xi][yi] = colorFunc(xi, yi);
      velocities[xi][yi] = createVector(0.0, 0.0);
    }
  }
  
  gridStep = width / GRID_NUM;
  lastSeconds = millis() * 0.001;
}

function getInitialColorFunction() {
  return random() < 0.5 ? getThreeToneColorFunction() : getCircleColorFunciton();
}

function getThreeToneColorFunction() {
  const c1 = color(random() * 255, random() * 255, random() * 255);
  const c2 = color(random() * 255, random() * 255, random() * 255);
  const c3 = color(random() * 255, random() * 255, random() * 255);
  const r = random();
  return function(xi, yi) {
    const comp = r < 0.5 ? xi : yi;
    return comp < GRID_NUM * 0.333 ? c1 : comp < GRID_NUM * 0.666 ? c2 : c3;
  }
}

function getCircleColorFunciton() {
  const c1 = color(random() * 255, random() * 255, random() * 255);
  const c2 = color(random() * 255, random() * 255, random() * 255);
  const center = GRID_NUM * GRID_SIZE * 0.5;
  return function(xi, yi) {
    const px = xi * GRID_SIZE;
    const py = yi * GRID_SIZE;
    const d = sqrt(sq(px - center) + sq(py - center));
    return d < center * 0.5 ? c1 : c2;
  }
}

function draw() {
  update();
  render();
}

function update() {
  const now = millis() * 0.001;
  const deltaTime = (now - lastSeconds) * TIME_SCALE;
  lastSeconds = now;
  updateVelocities(deltaTime);
  updateColors(deltaTime);
}

function updateVelocities(deltaTime) {
  let nextVels = addForceToVelocities(velocities, deltaTime);
  nextVels = advectVelocities(nextVels, deltaTime);
  nextVels = attenuateVelocities(nextVels, deltaTime);  
  velocities = nextVels;
}

function addForceToVelocities(vels, deltaTime) {
  if (!mouseIsPressed) {
    return vels;
  }
  const mousePos = createVector(mouseX, mouseY).div(width).mult(GRID_NUM).mult(GRID_SIZE);
  const prevMousePos = createVector(pmouseX, pmouseY).div(width).mult(GRID_NUM).mult(GRID_SIZE);
  const force = p5.Vector.sub(mousePos, prevMousePos).mult(FORCE_SCALE).limit(MAX_FORCE).mult(deltaTime);

  const nextVels = new Array(GRID_NUM + 1);
  for (let xi = 0; xi < GRID_NUM + 1; xi++) {
    nextVels[xi] = new Array(GRID_NUM + 1);
    for (let yi = 0; yi < GRID_NUM + 1; yi++) {
      const pos = createVector(xi, yi).mult(GRID_SIZE);
      const d = p5.Vector.mag(p5.Vector.sub(pos, mousePos));
      const forceScale = max((FORCE_RANGE - d) / FORCE_RANGE, 0.0);
      nextVels[xi][yi] = p5.Vector.add(vels[xi][yi], force.copy().mult(forceScale));
    }
  }
  return nextVels;
}

function advectVelocities(vels, deltaTime) {
  const nextVels = new Array(GRID_NUM + 1);
  for (let xi = 0; xi < GRID_NUM + 1; xi++) {
    nextVels[xi] = new Array(GRID_NUM + 1);
    for (let yi = 0; yi < GRID_NUM + 1; yi++) {
      const pos = createVector(xi * GRID_SIZE, yi * GRID_SIZE);
      const vel = vels[xi][yi].copy();
      vel.mult(-1).mult(deltaTime);
      pos.add(vel);
      pos.div(GRID_SIZE);
      nextVels[xi][yi] = getVelocity(vels, pos.x, pos.y);
    }
  }
  return nextVels;
}

function attenuateVelocities(vels, deltaTime) {
  const nextVels = new Array(GRID_NUM + 1);
  for (let xi = 0; xi < GRID_NUM + 1; xi++) {
    nextVels[xi] = new Array(GRID_NUM + 1);
    for (let yi = 0; yi < GRID_NUM + 1; yi++) {
      nextVels[xi][yi] = vels[xi][yi].copy().mult(1.0 - (1.0 - ATTENUATION_RATE) * deltaTime);
    }
  }
  return nextVels;
}

function updateColors(deltaTime) {
  const nextCols = new Array(GRID_NUM + 1);
  for (let xi = 0; xi < GRID_NUM + 1; xi++) {
    nextCols[xi] = new Array(GRID_NUM + 1);
    for (let yi = 0; yi < GRID_NUM + 1; yi++) {
      const pos = createVector(xi * GRID_SIZE, yi * GRID_SIZE);
      const vel = velocities[xi][yi].copy();
      vel.mult(-1).mult(deltaTime);
      pos.add(vel);
      pos.div(GRID_SIZE);
      nextCols[xi][yi] = getColor(pos.x, pos.y);    
    }
  }
  colors = nextCols;
}
  
function getVelocity(vels, x, y) {
  if (x < 0.0 || y < 0.0 || x >= GRID_NUM || y >= GRID_NUM) {
    return createVector(0.0, 0.0);
  }
  const ix = floor(x);
  const iy = floor(y);
  
  const fx = x - ix;
  const fy = y - iy;
  
  return p5.Vector.lerp(
    p5.Vector.lerp(vels[ix][iy], vels[ix + 1][iy], fx),
    p5.Vector.lerp(vels[ix][iy + 1], vels[ix + 1][iy + 1], fx),
    fy
  );
}

function getColor(x, y) {
  if (x < 0.0 || y < 0.0 || x >= GRID_NUM  || y >= GRID_NUM) {
    return color(255);
  }
  const ix = floor(x);
  const iy = floor(y);
  
  const fx = x - ix;
  const fy = y - iy;
  
  return lerpColor(
    lerpColor(colors[ix][iy], colors[ix + 1][iy], fx),
    lerpColor(colors[ix][iy + 1], colors[ix + 1][iy + 1], fx),
    fy
  );
}

function render() {
  background(255);
  noStroke();
  for (let xi = 0; xi < GRID_NUM; xi++) {
    const xj = xi + 1;
    for (let yi = 0; yi < GRID_NUM; yi++) {
      const yj = xi + 1;
      if (!RENDER_VELOCITIES) {
        const c = getColor(xi + 0.5, yi + 0.5);
        fill(c);
      } else {
        const v = getVelocity(velocities, xi + 0.5, yi + 0.5).copy();
        v.add(RENDER_VELOCITIES_CLAMP_VALUE, RENDER_VELOCITIES_CLAMP_VALUE);
        v.x = v.x < 0.0 ? 0.0 :
              v.x > 2.0 * RENDER_VELOCITIES_CLAMP_VALUE ? 1.0 :
              v.x / (2.0 * RENDER_VELOCITIES_CLAMP_VALUE);
        v.y = v.y < 0.0 ? 0.0 :
              v.y > 2.0 * RENDER_VELOCITIES_CLAMP_VALUE ? 1.0 :
              v.y / (2.0 * RENDER_VELOCITIES_CLAMP_VALUE);
        v.mult(255);
        fill(v.x, v.y, 128);
      }
      rect(xi * gridStep, yi * gridStep, gridStep, gridStep);
    }
  }
}
