feature 'outcome' do
  scenario 'provides a confirmation of the winner and loser' do
    sign_in_and_play

    11.times do
      click_button('attack')
      click_button('ok')
    end

    expect(page).to have_content("AI wins!\nHuman loses")
  end
end