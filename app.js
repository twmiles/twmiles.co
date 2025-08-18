/* -----------------------------------------------
/* How to use? : Check the GitHub README
/* ----------------------------------------------- */

/* To load a config file (particles.json) you need to host this demo (MAMP/WAMP/local)... */
/*
particlesJS.load('particles-js', 'particles.json', function() {
  console.log('particles.js loaded - callback');
});
*/

/* Otherwise just put the config content (json): */

(function(){
  var prefersReducedMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  var isSmallScreen = window.innerWidth < 768;
  if (prefersReducedMotion || isSmallScreen) {
    return; // Skip initializing particles for performance/accessibility
  }

  particlesJS('particles-js',
  {
    "particles": {
      "number": {
        "value": 100,
        "density": {
          "enable": true,
          "value_area": 1000
        }
      },
      "color": { "value": "#0f766e" },
      "shape": { "type": "circle", "stroke": { "width": 0, "color": "#000000" } },
      "opacity": { "value": 0.3, "random": false },
      "size": { "value": 3, "random": true },
      "line_linked": {
        "enable": true,
        "distance": 150,
        "color": "#0f766e",
        "opacity": 0.22,
        "width": 1
      },
      "move": {
        "enable": true,
        "speed": 2.4,
        "direction": "right",
        "random": false,
        "straight": false,
        "out_mode": "out",
        "bounce": false
      }
    },
    "interactivity": {
      "detect_on": "canvas",
      "events": { "onhover": { "enable": false }, "onclick": { "enable": true, "mode": "push" }, "resize": true },
      "modes": { "push": { "particles_nb": 4 } }
    },
    "retina_detect": false
  });
})();
