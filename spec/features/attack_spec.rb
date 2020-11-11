feature 'attack player 2' do
  scenario 'player 1 attacks player 2 and wins' do
    sign_in_and_play
    click_button('attack')
    expect(page).to have_content('AI attacks Human')
  end

  scenario 'attack button reduces hit points ' do
    sign_in_and_play
    click_button('attack')
    expect(page).not_to have_content('Human 60HP')
    expect(page).to have_content('Human 50HP')
  end
end