import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// const addLoggingToDispatch = (store) => {
//   const disp = store.dispatch;
//   return (action) => {
//     console.log("Old State:");
//     console.log(store.getState());
//
//     console.log("Action:");
//     console.log(action);
//
//     disp(action);
//
//     console.log("New State:");
//     console.log(store.getState());
//   };
// };

// const addLoggingToDispatch = store => next => action => {
//       console.log("Old State:");
//       console.log(store.getState());
//
//       console.log("Action:");
//       console.log(action);
//
//       let result = next(action);
//
//       console.log("New State:");
//       console.log(store.getState());
//
//       return result;
// };
//
// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };



document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  // store.dispatch = addLoggingToDispatch(store);

  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
