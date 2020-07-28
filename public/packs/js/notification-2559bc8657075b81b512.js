/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/notification.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/notification.js":
/*!**********************************************!*\
  !*** ./app/javascript/packs/notification.js ***!
  \**********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /home/anbinh/Desktop/open-ruby-2019-hiring-player/app/javascript/packs/notification.js: Unexpected token, expected \",\" (3:3)\n\n  1 | (function notificaitons(){\n  2 |     alert('abc');\n> 3 |   };\n    |    ^\n  4 | )\n  5 | \n    at Parser.raise (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:6975:17)\n    at Parser.unexpected (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:8368:16)\n    at Parser.expect (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:8354:28)\n    at Parser.parseParenAndDistinguishExpression (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:9749:14)\n    at Parser.parseExprAtom (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:9548:21)\n    at Parser.parseExprSubscripts (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:9210:23)\n    at Parser.parseMaybeUnary (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:9190:21)\n    at Parser.parseExprOps (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:9056:23)\n    at Parser.parseMaybeConditional (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:9029:23)\n    at Parser.parseMaybeAssign (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:8975:21)\n    at Parser.parseExpression (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:8925:23)\n    at Parser.parseStatementContent (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:10785:23)\n    at Parser.parseStatement (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:10656:17)\n    at Parser.parseBlockOrModuleBlockBody (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:11232:25)\n    at Parser.parseBlockBody (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:11219:10)\n    at Parser.parseTopLevel (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:10587:10)\n    at Parser.parse (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:12097:10)\n    at parse (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/parser/lib/index.js:12148:38)\n    at parser (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/core/lib/transformation/normalize-file.js:168:34)\n    at normalizeFile (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/core/lib/transformation/normalize-file.js:102:11)\n    at runSync (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/core/lib/transformation/index.js:44:43)\n    at runAsync (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/core/lib/transformation/index.js:35:14)\n    at process.nextTick (/home/anbinh/Desktop/open-ruby-2019-hiring-player/node_modules/@babel/core/lib/transform.js:34:34)\n    at processTicksAndRejections (internal/process/task_queues.js:79:9)");

/***/ })

/******/ });
//# sourceMappingURL=notification-2559bc8657075b81b512.js.map