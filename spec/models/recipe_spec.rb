require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.build(:recipe)
  end

  describe 'レシピ情報の登録' do
    context 'レシピ情報が登録できる場合' do
      it 'recipe_title、recipe_procedure、recipe_volume、recipe_material、recipe_quantity、
          cooking_time、tool_id、category_id、imageが存在すれば登録できる' do
        expect(@recipe).to be_valid
      end
    end

    context 'レシピ情報が登録できない場合' do
      it 'recipe_titleが空では登録できない' do
        @recipe.recipe_title = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include 'タイトルを入力してください'
      end
      it 'recipe_procedureが空では登録できない' do
        @recipe.recipe_procedure = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '調理手順を入力してください'
      end
      it 'recipe_volumeが空では登録できない' do
        @recipe.recipe_volume = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '量を入力してください'
      end
      it 'recipe_volumeには英字は登録できない' do
        @recipe.recipe_volume = 'ab'
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '量は数値で入力してください'
      end
      it 'recipe_volumeには全角文字は登録できない' do
        @recipe.recipe_volume = '一二'
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '量は数値で入力してください'
      end
      it 'recipe_volumeには全角数字は登録できない' do
        @recipe.recipe_volume = '１２'
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '量は数値で入力してください'
      end
      it 'recipe_volumeが100以上では登録できない' do
        @recipe.recipe_volume = '100'
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '量は99以下の値にしてください'
      end
      it 'recipe_materialが空では登録できない' do
        @recipe.recipe_material = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '材料を入力してください'
      end
      it 'recipe_quantityが空では登録できない' do
        @recipe.recipe_quantity = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '使用量を入力してください'
      end
      it 'cooking_timeが空では登録できない' do
        @recipe.cooking_time = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '調理時間を入力してください'
      end
      it 'cooking_timeには英字は登録できない' do
        @recipe.cooking_time = 'abc'
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '調理時間は数値で入力してください'
      end
      it 'cooking_timeには全角文字は登録できない' do
        @recipe.cooking_time = '一二三'
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '調理時間は数値で入力してください'
      end
      it 'cooking_timeには全角数字は登録できない' do
        @recipe.cooking_time = '１２３'
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '調理時間は数値で入力してください'
      end
      it 'cooking_timeが1000以上では登録できない' do
        @recipe.cooking_time = '1000'
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '調理時間は999以下の値にしてください'
      end
      it 'tool_idに「---」が選択されている場合は登録できない' do
        @recipe.tool_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include '調理器具を入力してください'
      end
      it 'category_idに「---」が選択されている場合は登録できない' do
        @recipe.category_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include 'カテゴリーを入力してください'
      end
      it 'userが紐付いていないと保存できない' do
        @recipe.user = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
