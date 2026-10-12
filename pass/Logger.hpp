#pragma once

#include <cstddef>
#include <filesystem>
#include <format>
#include <fstream>
#include <iterator>
#include <string>
#include <string_view>
#include <utility>

class Logger {
public:
  Logger(std::size_t max_lines, std::filesystem::path path)
      : remaining(max_lines), path(std::move(path)) {}

  template <typename... Args>
  void println(std::format_string<Args...> fmt, Args &&...args) {
    if (remaining == 0)
      return;
    buffer.clear();
    std::format_to(std::back_inserter(buffer), fmt,
                   std::forward<Args>(args)...);
    buffer.push_back('\n');
    write(buffer);
    if (--remaining == 0)
      file.close();
  }

private:
  void write(std::string_view chars) {
    if (!file.is_open())
      file.open(path, std::ios::trunc);
    file.write(chars.data(), static_cast<std::streamsize>(chars.size()));
  }

  std::size_t remaining;
  std::filesystem::path path;
  std::ofstream file;
  std::string buffer;
};
