feature 'lose the game' do
  scenario 'player_two loses the game' do
    sign_in_and_play

    11.times do
      click_button('attack')
      click_button('ok')
    end
    
    expect(page).to have_content('AI wins, Human loses')
  end
end