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

end
