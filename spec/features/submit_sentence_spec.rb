require "rails_helper"

RSpec.describe "the user submission form", type: :feature, js: true do
  before(:all) do
    Capybara.current_driver = :selenium
  end

  it 'should allow a submission' do
    visit sentences_path
    chinese = "你好，欢迎。"
    fill_in "sentence_words", with: chinese
    click_button "Submit Sentence"
    expect(page).to have_content(chinese)
  end

  after(:all) do
    Capybara.use_default_driver
  end
end
