class Mycli < Formula
  include Language::Python::Virtualenv

  desc "CLI for MySQL with auto-completion and syntax highlighting"
  homepage "https://www.mycli.net/"
  url "https://files.pythonhosted.org/packages/d6/e9/e3555839dec9ddbb94e20e5f5b7b633efc603986cffe1113f99048306887/mycli-1.26.1.tar.gz"
  sha256 "8c03035c9b4526dbfa0b0859654e2974a0e77592a9e9b27f40f5a8daae83beb1"
  license "BSD-3-Clause"
  revision 1

  bottle do
    rebuild 1
    sha256 cellar: :any,                 arm64_ventura:  "0b8c4f827069621f36abd6271e8113115b038871dc45eec0612c761cf25046f6"
    sha256 cellar: :any,                 arm64_monterey: "193f6a7027770c9044d4b5ce790a3e8911089dbf9c3ed393f81119f88048f428"
    sha256 cellar: :any,                 arm64_big_sur:  "f2250565be2f274be5abbee1985ff2d61ec6ab5bc9731615f62639408ea78163"
    sha256 cellar: :any,                 ventura:        "bab589ea0518ed4a2c0350ce4a70ad0e86145766c36aa410af425a52d7a68f26"
    sha256 cellar: :any,                 monterey:       "9fb2a9aea8671cb663546368f4e63b57ed9371929e452e2be216080421ca3ab8"
    sha256 cellar: :any,                 big_sur:        "30ae98cbc5eeb3a6afe19a455c39f6f1a6e9720fcfacdd8c13c6a216537baece"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "56cd2ee7ea73090f1af8970581ee4455b80795d149399b9b1b06b21c073c42b3"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"
  depends_on "pygments"
  depends_on "python-tabulate"
  depends_on "python@3.11"
  depends_on "six"

  uses_from_macos "libffi"

  on_linux do
    depends_on "pkg-config" => :build
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/2b/a8/050ab4f0c3d4c1b8aaa805f70e26e84d0e27004907c5b8ecc1d31815f92a/cffi-1.15.1.tar.gz"
    sha256 "d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9"
  end

  resource "cli-helpers" do
    url "https://files.pythonhosted.org/packages/27/01/6aaa4fc415274ac77372b4d259c234b9f5bfc8d78144c3fda1f3019d4690/cli_helpers-2.3.0.tar.gz"
    sha256 "e7174d003a2b58fd3e31a73fbbc45d5aa513de62cbd42d437f78b9658bd5f967"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
    sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
  end

  resource "configobj" do
    url "https://files.pythonhosted.org/packages/cb/87/17d4c6d634c044ab08b11c0cd2a8a136d103713d438f8792d7be2c5148fb/configobj-5.0.8.tar.gz"
    sha256 "6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/10/a7/51953e73828deef2b58ba1604de9167843ee9cd4185d8aaffcb45dd1932d/cryptography-36.0.2.tar.gz"
    sha256 "70f8f4f7bb2ac9f340655cbac89d68c527af5bb4387522a8413e841e3e6628c9"
  end

  resource "importlib-resources" do
    url "https://files.pythonhosted.org/packages/2e/f8/be5c59ff2545362397cbc989f5cd3835326fc4092433d50dfaf21616bc71/importlib_resources-5.10.2.tar.gz"
    sha256 "e4a96c8cc0339647ff9a5e0550d9f276fc5a01ffa276012b58ec108cfd7b8484"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/fb/93/180be2342f89f16543ec4eb3f25083b5b84eba5378f68efff05409fb39a9/prompt_toolkit-3.0.36.tar.gz"
    sha256 "3e163f254bef5a03b146397d7c1963bd3e2812f0964bb9a24e6ec761fd28db63"
  end

  resource "pyaes" do
    url "https://files.pythonhosted.org/packages/44/66/2c17bae31c906613795711fc78045c285048168919ace2220daa372c7d72/pyaes-1.6.1.tar.gz"
    sha256 "02c1b1405c38d3c370b085fb952dd8bea3fadcee6411ad99f312cc129c536d8f"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de/pycparser-2.21.tar.gz"
    sha256 "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
  end

  resource "PyMySQL" do
    url "https://files.pythonhosted.org/packages/60/ea/33b8430115d9b617b713959b21dfd5db1df77425e38efea08d121e83b712/PyMySQL-1.0.2.tar.gz"
    sha256 "816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5d7ad36"
  end

  resource "pyperclip" do
    url "https://files.pythonhosted.org/packages/a7/2c/4c64579f847bd5d539803c8b909e54ba087a79d01bb3aba433a95879a6c5/pyperclip-1.8.2.tar.gz"
    sha256 "105254a8b04934f0bc84e9c24eb360a591aaf6535c9def5f29d92af107a9bf57"
  end

  resource "sqlglot" do
    url "https://files.pythonhosted.org/packages/d7/c0/cabf73bd17f971051ebbf1736605505829963b40ca7c46ce659cf82f0a90/sqlglot-11.0.0.tar.gz"
    sha256 "6bd55a4b5898de900126390438a7cd13f77b042527f0711524e3288018d292fe"
  end

  resource "sqlparse" do
    url "https://files.pythonhosted.org/packages/ba/fa/5b7662b04b69f3a34b8867877e4dbf2a37b7f2a5c0bbb5a9eed64efd1ad1/sqlparse-0.4.3.tar.gz"
    sha256 "69ca804846bb114d2ec380e4360a8a340db83f0ccf3afceeb1404df028f57268"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/5e/5f/1e4bd82a9cc1f17b2c2361a2d876d4c38973a997003ba5eb400e8a932b6c/wcwidth-0.2.6.tar.gz"
    sha256 "a5220780a404dbe3353789870978e472cfe477761f06ee55077256e509b156d0"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"mycli", "--help"
  end
end
