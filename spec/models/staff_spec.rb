require 'rails_helper'

RSpec.describe 'Staffモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { staff.valid? }

    let!(:other_staff) { create(:staff) }
    let(:staff) { build(:staff) }

    context 'nameカラム' do
      it '空欄でないこと' do
        staff.name = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'FixedAssetモデルとの関係' do
      it '1:Nとなっている' do
        expect(Staff.reflect_on_association(:fixed_assets).macro).to eq :has_many
      end
    end
  end
end
