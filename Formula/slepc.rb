class Slepc < Formula
  desc "Scalable Library for Eigenvalue Computations"
  homepage "https://slepc.upv.es/"
  url "http://slepc.upv.es/download/distrib/slepc-3.18.2.tar.gz"
  sha256 "5bd90a755934e702ab1fdb3320b9fe75ab5fc28c93d364248ea86a372fbe6a62"
  revision 1

  option "with-test", "Run slepc post-build tests (recommended but time consuming)"

  # fortran needed
  depends_on "gcc" if OS.mac?
  depends_on "hdf5"
  depends_on "open-mpi"
  depends_on "petsc"
  depends_on "openblas"
  depends_on "arpack"
  depends_on "libx11" => :optional

  def install
    ENV.deparallelize

    ENV["SLEPC_DIR"] = Dir.getwd
    args = ["--with-clean=true"]
    args << "--with-arpack-dir=#{Formula["arpack"].opt_lib}"
    args << "--download-blopex"

    # real
    ENV["PETSC_DIR"] = "#{Formula["petsc"].opt_prefix}"
    system "./configure", "--prefix=#{prefix}", *args
    system "make"
    system "make", "test" if build.with? "test"
    system "make", "install"

    # Link what we need.

    include.install_symlink Dir["#{prefix}/include/*.h"],
                            "#{prefix}/gfinclude", "#{prefix}/slepc-private"
    lib.install_symlink Dir["#{prefix}/glib/*.*"]
    prefix.install_symlink "#{prefix}/gconf"
    doc.install "docs/slepc.pdf", Dir["docs/*.html"], "docs/manualpages" # They're not really man pages.
    pkgshare.install "share/slepc/datafiles"

    # install some tutorials for use in test block
    pkgshare.install "src/eps/tutorials"
  end

  def caveats
    <<~EOS
      Set your SLEPC_DIR to #{opt_prefix}
      Fortran modules are in #{opt_prefix}/include
    EOS
  end

  test do
    cp_r prefix/"share/slepc/tutorials", testpath
    Dir.chdir("tutorials") do
      system "mpicc", "ex1.c", "-I#{opt_include}", "-I#{Formula["petsc"].opt_include}",
"-L#{Formula["petsc"].opt_lib}", "-lpetsc", "-L#{opt_lib}", "-lslepc", "-o", "ex1"
      system "mpirun -np 3 ex1 2>&1 | tee ex1.out"
      `cat ex1.out | tail -3 | awk '{print $NF}'`.split.each do |val|
        assert val.to_f < 1.0e-8
      end
    end
  end
end
