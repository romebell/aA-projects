import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state)
  var orgState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon
    default:
      return orgState
  }
}

export default pokemonReducer;