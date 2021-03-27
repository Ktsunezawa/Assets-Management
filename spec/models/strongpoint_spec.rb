require 'rails_helper'

RSpec.describe 'Strongpointモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { strongpoint.valid? }

    let!(:other_strongpoint) { create(:strongpoint) }
    let!(:strongpoint) { build(:strongpoint) }

    context 'nameカラム' do
      it '空欄でないこと' do
        strongpoint.name = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        strongpoint.name = other_strongpoint.name
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'FixedAssetモデルとの関係' do
      it '1:Nとなっている' do
        expect(Strongpoint.reflect_on_association(:fixed_assets).macro).to eq :has_many
      end
    end
  end
end
