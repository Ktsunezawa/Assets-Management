require 'rails_helper'

RSpec.describe 'ClassificationDetailモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { classification_detail.valid? }

    let!(:classification_detail) { build(:classification_detail) }

    context 'classificationカラム' do
      it '空欄でないこと' do
        classification_detail.classification = ''
        is_expected.to eq false
      end
    end
    context 'detailカラム' do
      it '空欄でないこと' do
        classification_detail.detail = ''
        is_expected.to eq false
      end
    end
    context 'useful_lifeカラム' do
      it '空欄でないこと' do
        classification_detail.useful_life = ''
        is_expected.to eq false
      end
    end
    context 'useful_lifeカラム' do
      it '数値以外でないこと' do
        classification_detail.useful_life = Faker::Lorem.characters(number:1)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'FixedAssetモデルとの関係' do
      it '1:1となっている' do
        expect(ClassificationDetail.reflect_on_association(:fixed_asset).macro).to eq :has_one
      end
    end
  end
end
