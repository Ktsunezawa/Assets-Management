require 'rails_helper'

RSpec.describe 'FixedAssetモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { fixed_asset.valid? }

    let(:base) {build(:base)}
    let(:staff) {build(:staff)}
    let(:classification_detail) {build(:classification_detail)}
    let(:post_image){ build(:post_image)}
    let(:fixed_asset) { build(:fixed_asset, {staff_id: staff.id, base_id: base.id, classification_detail_id: classification_detail.id, post_image_ids: []}) }

    context 'nameカラム' do
      it '空欄でないこと' do
        fixed_asset.name = ''
        is_expected.to eq false
      end
    end
    context 'costカラム' do
      it '空欄でないこと' do
        fixed_asset.cost = ''
        is_expected.to eq false
      end
    end
    context 'memoカラム' do
      it '空欄でないこと' do
        fixed_asset.memo = ''
        is_expected.to eq false
      end
    end
    context 'acquisition_dateカラム' do
      it '空欄でないこと' do
        fixed_asset.acquisition_date = ''
        is_expected.to eq false
      end
    end
    context 'Base.nameカラム' do
      it '空欄でないこと' do
        base.name = ''
        is_expected.to eq false
      end
    end
    context 'ClassificationDetail.classificationカラム' do
      it '空欄でないこと' do
        classification_detail.classification = ''
        is_expected.to eq false
      end
    end
    context 'ClassificationDetail.detailカラム' do
      it '空欄でないこと' do
        classification_detail.detail = ''
        is_expected.to eq false
      end
    end
    context 'ClassificationDetail.useful_lifeカラム' do
      it '空欄でないこと' do
        classification_detail.useful_life = ''
        is_expected.to eq false
      end
    end
    context 'PostImage.imageカラム' do
      it '空欄でないこと' do
        post_image.image = ''
        is_expected.to eq false
      end
    end
    context 'costカラム' do
      it '数値以外でないこと' do
        fixed_asset.cost = Faker::Lorem.characters(number:1)
        is_expected.to eq false
      end
    end
    context 'ClassificationDetail.useful_lifeカラム' do
      it '数値以外でないこと' do
        classification_detail.useful_life = Faker::Lorem.characters(number:1)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'ClassificationDetailモデルとの関係' do
      it '1:1となっている' do
        expect(FixedAsset.reflect_on_association(:classification_detail).macro).to eq :belongs_to
      end
    end
    context 'PostImageモデルとの関係' do
      it '1:Nとなっている' do
        expect(FixedAsset.reflect_on_association(:post_images).macro).to eq :has_many
      end
    end
    context 'Staffモデルとの関係' do
      it 'N:1となっている' do
        expect(FixedAsset.reflect_on_association(:staff).macro).to eq :belongs_to
      end
    end
    context 'Baseモデルとの関係' do
      it 'N:1となっている' do
        expect(FixedAsset.reflect_on_association(:base).macro).to eq :belongs_to
      end
    end
  end
end
