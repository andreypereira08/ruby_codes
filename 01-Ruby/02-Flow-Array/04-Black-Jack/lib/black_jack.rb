def pick_bank_score
  # TODO: Use Random to get a new random score
  return (16..21).to_a.sample
end

def pick_player_card
  # TODO: Use Random to get a new random card
  return (1..11).to_a.sample
end
