import React from 'react';
import ReactDOM from 'react-dom';
import {HashRouter, Route} from 'react-router-dom';
import * as APIUtil from './util/api_util';
// import { RECEIVE_ALL_POKEMON, receiveAllPokemon } from './actions/pokemon_actions'
import {configureStore} from './store/store';
import {requestOnePokemon} from './actions/pokemon_actions';
// import selectAllPokemon from './reducers/selectors'; 
import Root from './components/root';
import { RECEIVE_ONE_POKEMON, receiveOnePokemon } from './actions/pokemon_actions'



document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  ReactDOM.render(<Root store={store}/>, root)
});

// TESTING
// window.configureStore = configureStore;
window.receiveOnePokemon = receiveOnePokemon;
window.requestOnePokemon = requestOnePokemon;
window.fetchOnePokemon = APIUtil.fetchOnePokemon;
// window.selectAllPokemon = selectAllPokemon;