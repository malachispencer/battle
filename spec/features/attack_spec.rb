feature 'attack player 2' do
  scenario 'player 1 attacks player 2 and wins' do
    sign_in_and_play
    click_button('attack')
    expect(page).to have_content('AI attacks Human')
  end
end