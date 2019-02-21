import React from 'react';
import ReactDOM from 'react-dom';
import * as APIUtil from './util/api_util';
import { RECEIVE_ALL_POKEMON, receiveAllPokemon } from './actions/pokemon_actions'
import {configureStore} from './store/store';
import {requestAllPokemon} from './actions/pokemon_actions';
import selectAllPokemon from './reducers/selectors';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  ReactDOM.render(<Root store={store}/>, root)
});

// TESTING
window.configureStore = configureStore;
window.receiveAllPokemon = receiveAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.fetchAllPokemon = APIUtil.fetchAllPokemon;
window.selectAllPokemon = selectAllPokemon;