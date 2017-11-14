import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';


const addLoggingToDispatch = store => next => action => {
      console.log("Old State:");
      console.log(store.getState());

      console.log("Action:");
      console.log(action);

      let result = next(action);

      console.log("New State:");
      console.log(store.getState());

      return result;
};

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
