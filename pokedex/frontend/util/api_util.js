export const fetchAllPokemon = () => {
  return $.ajax({
    method: "GET",
    url: 'api/pokemons'
  })
};

// export default fetchAllPokemon