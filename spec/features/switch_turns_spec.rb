feature 'switch turns' do
  scenario 'at the start of the game' do
    sign_in_and_play
    expect(page).to have_content("AI's turn")
  end

  scenario 'after player_one attacks' do
    sign_in_and_play
    click_button('attack')
    click_link('ok')
    expect(page).not_to have_content("AI's turn")
    expect(page).to have_content("Human's turn")
  end
end
