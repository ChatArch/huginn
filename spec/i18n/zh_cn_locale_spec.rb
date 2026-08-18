require 'rails_helper'

RSpec.describe 'Chinese localization' do
  it 'loads the Chinese locale and core translations' do
    expect(I18n.available_locales).to include(:'zh-CN')
    expect(I18n.t('huginn.auth.log_in', locale: :'zh-CN')).to eq('登录')
    expect(I18n.t('huginn.auth.forgot_password', locale: :'zh-CN')).to eq('忘记密码？')
    expect(I18n.t('huginn.navigation.agents', locale: :'zh-CN')).to eq('代理')
    expect(I18n.t('huginn.scenarios.title', locale: :'zh-CN')).to eq('场景')
    expect(I18n.t('huginn.events.title', locale: :'zh-CN')).to eq('事件')
  end

  it 'keeps the deployment default locale configurable by environment' do
    application_rb = Rails.root.join('config/application.rb').read
    expect(application_rb).to include("HUGINN_DEFAULT_LOCALE")
  end
end
