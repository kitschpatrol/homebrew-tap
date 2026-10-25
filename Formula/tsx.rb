class Tsx < Formula
  desc "Node.js enhanced with esbuild to run TypeScript and ESM files"
  homepage "https://tsx.hirok.io"
  url "https://registry.npmjs.org/tsx/-/tsx-4.23.15.tgz"
  sha256 "60eeb6697e987b40ea1944061f186c2314b8381fd6da4dc1bdbe75e0744a9f78"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tsx --version")

    (testpath/"hello.ts").write <<~TYPESCRIPT
      const greeting: string = "Hello, Homebrew!"
      console.log(greeting)
    TYPESCRIPT
    assert_equal "Hello, Homebrew!", shell_output("#{bin}/tsx hello.ts").strip
  end
end
