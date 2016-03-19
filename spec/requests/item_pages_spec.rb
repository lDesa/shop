require "rails_helper"

describe "Click Items" do

	  subject { page }

  	let(:item) { FactoryGirl.create(:item)}
    before do 
    	visit admin_items_path
    	click_link 'Товары'

    end 
    it { should have_selector('th', text: 'Name') }
    

    describe "New Item" do
      before do
      	click_link "Новый товар"
      end
      let(:submit) { "Создать" }
      it { should have_selector('h2', text: 'Создание товара') }



      describe "with invalid information " do
       
       it "should create a item" do
          expect { click_button submit  }.not_to change(Item, :count)
       end


       describe "after click create" do 
         before { click_button submit }
         it { should have_content("Item isn't create!") }

       end

      end

      describe "with valid information" do


        before do 
          fill_in "Название",    with:  item.name + "р"
          fill_in "Описание",    with:  item.description
          fill_in "Цена",        with:  item.price
          fill_in "Изображение", with:  item.image
          fill_in "Создатель",   with:  item.user_id
          fill_in "Магазин",     with:  item.shop_id
          fill_in "Категория",   with:  item.category_id

        end

        describe "after click create" do 
          before { click_button submit  }
          it { should have_content("Item is created!") }
          it { should have_selector('th', text: 'Name') }

        end

        it "should create a item" do
          expect { click_button submit }.to change(Item, :count).by(1)
        end

      end

    end

    describe "Edit Item" do
      before do
      	item.save
        visit current_path
      	click_link "Edit"
      end
      let(:submit) { "Сохранить" }
      it { should have_selector('h2', text: 'Редактирование товара') }



      describe "with invalid information " do
       
       it "should edit a item" do
          expect { click_button submit  }.not_to change(item, :name)
       end


       describe "after click create" do 
         before do
         	 fill_in "Название",        with: ""

           click_button submit 
         end
         it { should have_content("Item isn't edit!")}
       end

      end

      describe "with valid information" do


        before do 
          fill_in "Название",    with:  item.name + "р"
          fill_in "Описание",    with:  item.description
          fill_in "Цена",        with:  item.price
          fill_in "Изображение", with:  item.image
          fill_in "Создатель",   with:  item.user_id
          fill_in "Магазин",     with:  item.shop_id
          fill_in "Категория",   with:  item.category_id

          click_button submit 
          item.reload
        end

        describe "after click edit" do 

          it { should have_content("Item is success edit!") }
          it { should have_selector('th', text: 'Name') }
          
          it {item.name.should == "Товарр" }

        end


      end

    end
end