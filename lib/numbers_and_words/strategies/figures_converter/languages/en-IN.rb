# frozen_string_literal: true

module NumbersAndWords
  module Strategies
    module FiguresConverter
      module Languages
        class EnIn < Base
          HINDUSTANI_FIGURES_IN_CAPACITY = 2

          def complex_number_to_words
            (1..capacity_count).map do |capacity|
              @current_capacity = capacity
              capacity_iteration
            end.flatten
          end

          def words_in_capacity(capacity = 0)
            save_parent_figures do
              @figures = array_in_capacity(@parent_figures, capacity).to_figures
              strings_logic
            end
          end

          alias number_without_capacity_to_words words_in_capacity

          private

          def capacity_count
            count = (figures.capacity_length - 3) / HINDUSTANI_FIGURES_IN_CAPACITY
            count += 1 if figures.capacity_length >= 3
            
            count.positive? ? count : nil
          end

          def array_in_capacity(all_figures, capacity)
            if capacity == 0
              all_figures[0, FiguresArray::FIGURES_IN_CAPACITY]
            else
              all_figures[FiguresArray::FIGURES_IN_CAPACITY + ((capacity - 1) * HINDUSTANI_FIGURES_IN_CAPACITY), HINDUSTANI_FIGURES_IN_CAPACITY]
            end
          end
        end
      end
    end
  end
end
