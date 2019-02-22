import React from 'react';
import PokemonIndexItem from './pokemon_index_item';


class PokemonIndex extends React.Component {

  render() {
    const pokemonItems = this.props.pokemon.map( poke => <PokemonIndexItem key={poke.id} pokemon={poke} />)
    return (
      <>
        <section className="pokedex">
          <ul>
            {pokemonItems}
          </ul>
        </section>
      </>
    
      
    )
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }
}

export default PokemonIndex;