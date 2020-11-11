
def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'AI'
  fill_in :player_2_name, with: 'Human'
  click_button 'Submit'
end