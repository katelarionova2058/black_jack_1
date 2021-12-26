class Interface
  def get_name
    puts "Введите свое имя"
  end

  def play
    puts "Игра началась"
  end

  def game_over
    puts "Игра завершена"
  end

  def choice_menu(cards, score, player_bank, dealer_bank)
    puts "Ваши карты: #{cards}. Ваш счёт: #{score}. Ваш банк: $#{player_bank}"
    puts "Карты дилера [**, **]. Счёт дилера [**]. Банк дилера: $#{dealer_bank}"
    puts '0 - закончить игру'
    puts '1 - взять дополнительную карту'
    puts '2 - открыть карты'
    puts '3 - пропустить ход'
  end

  def max_cards
    puts 'У вас максимальное количество карт! Ход переходит дилеру'
  end

  def added_card
    puts 'Вы взяли дополнительную карту, ход переходит к дилеру'
  end

  def player_info(name, cards, score)
    puts "Карты игрока #{name}: #{cards}, сумма очков: #{score}"
  end

  def dealer_info(cards, score)
    puts "Карты игрока дилер: #{cards}, сумма очков: #{score}"
  end

  def menu(bank)
    puts "У вас в банке: $#{bank}"
    puts 'Введите 1, чтобы сыграть еще раз'
    puts 'Введите 0, чтобы закончить игру'
  end

  def dealer_skips
    puts 'Дилер пропускает ход, делайте ваш выбор'
  end

   def draw (bank)
    puts 'Ничья. У вас в банке: $#{bank}.'
  end

  def you_win(bank)
    puts
    puts "Вы победили. У вас в банке: $#{bank}."
  end

  def you_lost(bank)
    puts
    puts "Вы проиграли. У вас в банке: $#{bank}."
  end
end
