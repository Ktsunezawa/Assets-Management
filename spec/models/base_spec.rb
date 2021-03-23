require 'rails_helper'

RSpec.describe 'Baseモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { base.valid? }

    let!(:other_base) { create(:base) }
    let!(:base) { build(:base) }

    context 'nameカラム' do
      it '空欄でないこと' do
        base.name = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        base.name = other_base.name
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'FixedAssetモデルとの関係' do
      it '1:Nとなっている' do
        expect(Base.reflect_on_association(:fixed_assets).macro).to eq :has_many
      end
    end
  end
end
