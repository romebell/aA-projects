import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = (props) => {
    const poke = props.pokemon;
    return (
      <>
        <li key={poke.id}>
        <Link to={`/pokemon/${poke.id}`}>{poke.name} </Link>
          <img src={poke.image_url} width={100} height={100} />
           
        </li>
      </>
    )
}

export default PokemonIndexItem;