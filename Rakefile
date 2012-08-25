include Rake::DSL
require 'bundler'
Bundler.require

Wox::Tasks.create :info_plist => 'flipper/flipper-Info.plist', :sdk => 'iphoneos', :configuration => 'Release' do
  build :debug, :configuration => 'Debug'

  build :release, :developer_certificate => 'iPhone Distribution: OOO InTech' do
    ipa :adhoc, :provisioning_profile => 'A42C87F7-1582-4F9D-8A0D-288745333C59' do
      testflight :publish, :api_token => 'a3977a2c0068de2da1c13be524ba7c27_MzE5NjI0MjAxMi0wMi0xNiAwMjowOTo1NC4wMzk5ODM',
                           :team_token => '8a15af18760dfb541df175b7728d0bba_MTI1MjMxMjAxMi0wOC0yNSAxNzozODoyMi43NzQ4NTI',
                           :notes => proc { File.read("CHANGELOG") },
                           :distribution_lists => %w[Internal],
                           :notify => true

    end
  end
end
