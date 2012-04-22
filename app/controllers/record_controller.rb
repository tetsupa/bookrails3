# -*- coding: utf-8 -*-
class RecordController < ApplicationController
  def find
    @books = Book.find([2, 5, 10])
    render 'hello/list'
  end

  def dynamic_find
    @books = Book.find_all_by_publish('技術評論社')
    render ('hello/list')
  end

  def dynamic_find2
    @book = Book.find_by_publish_and_price('技術評論社', 2604)
    render ('books/show')
  end

  def where
    @books = Book.where(:publish => '技術評論社')
    render ('hello/list')
  end

  def ph1
    @books = Book.where('publish = ? AND price >= ?',
                        params[:publish], params[:price])
    render ('hello/list')
  end

  def order
    @books = Book.where(:publish => '技術評論社').order('published DESC')
    render 'hello/list'
  end

  def select
    @books = Book.where('price >= 2000').select('title, price')
    render 'hello/list'
  end

  def select2
    @books = Book.select('DISTINCT pblish').order('publish')
  end

  def offset
    @books = Book.order('published DESC').limit(3).offset(4)
    render 'hello/list'
  end

  def page
    page_size = 3
    page_num = params[:id] == nil ? 0 : params[:id].to_i - 1
    @books = Book.order('published DESC').limit(page_size).offset(page_size * page_num)
    render 'hello/list'
  end
end
