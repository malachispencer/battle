feature 'View hit points' do
  scenario 'see player_one hit points' do
    sign_in_and_play
    expect(page).to have_content 'AI 60HP'
  end

  scenario 'see player_one hit points' do
    sign_in_and_play
    expect(page).to have_content 'Human 60HP'
  end
end