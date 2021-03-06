# encoding: utf-8

require 'spec_helper'

describe Emojidex::UTF do
  let(:utf) { Emojidex::UTF.new }

  describe '.each' do
    it 'provides each emoji' do
      utf.each do |emoji|
        expect(emoji).to be_an_instance_of(Emojidex::Emoji)
      end
    end
  end

  describe '.find_by_moji' do
    it 'finds and returns an emoji object by UTF moji code' do
      expect(utf.find_by_moji('🌠')).to be_an_instance_of(Emojidex::Emoji)
    end

    it 'returns nil when the moji code does not exist' do
      expect(utf.find_by_moji('XX')).to be_nil
    end
  end

  describe '.文字検索' do
    it 'find_by_moji_codeをaliasして文字コードで検索する' do
      expect(utf.文字検索('🌠')).to be_an_instance_of(Emojidex::Emoji)
    end
  end

  describe '.find_by_code' do
    it 'finds and returns an emoji by code' do
      ss = utf.find_by_code('shooting_star')
      expect(ss).to be_an_instance_of(Emojidex::Emoji)
    end

    it 'returns nil when a code does not exist' do
      expect(utf.find_by_code('super_fantastic')).to be_nil
    end
  end

  describe '.find_by_code_ja' do
    it 'finds and returns an emoji by Japanese code' do
      expect(utf.find_by_code_ja('流れ星')).to be_an_instance_of(Emojidex::Emoji)
    end
  end

  describe '.コード検索' do
    it 'find_by_code_jaをaliasして日本語の絵文字コードで検索する' do
      expect(utf.コード検索('流れ星')).to be_an_instance_of(Emojidex::Emoji)
    end
  end

  describe '.cache!' do
    it 'caches emoji to local storage cache' do
      tmp_cache_path = File.expand_path('../support/tmpcache', __FILE__)
      utf.cache!(cache_dir: tmp_cache_path)
      expect(File.exist? tmp_cache_path).to be_true
      expect(File.exist? tmp_cache_path + '/sushi.svg').to be_true
      expect(File.exist? tmp_cache_path + '/emoji.json').to be_true

      FileUtils.rm_rf tmp_cache_path # cleanup
    end
  end
end
