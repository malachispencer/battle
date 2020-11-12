feature 'attack' do
  scenario 'player_one attacks player_two confirmation' do
    sign_in_and_play
    click_button('attack')
    expect(page).to have_content('AI attacks Human')
  end

  scenario 'player_two attacks player_one confirmation' do
    sign_in_and_play
    click_button('attack')
    click_button('ok')
    click_button('attack')
    expect(page).to have_content('Human attacks AI')
  end

  scenario 'attack button reduces hit points' do
    sign_in_and_play
    click_button('attack')
    click_button('ok')
    expect(page).not_to have_content('Human 60HP')
    expect(page).to have_content('Human 50HP')
  end

  scenario 'player_two attacks player_one' do
    sign_in_and_play
    click_button('attack')
    click_button('ok')
    click_button('attack')
    click_button('ok')
    expect(page).not_to have_content('AI 60HP')
    expect(page).to have_content('AI 50HP')
  end
end