enum Option { trueOption, falseOption, clearOption }

extension OptionExtension on Option {
  static Option getOption(String text) {
    switch (text) {
      case 'trueOption':
        return Option.trueOption;
      case 'falseOption':
        return Option.falseOption;
      case 'clearOption':
        return Option.clearOption;
    }

    return Option.clearOption;
  }
}
