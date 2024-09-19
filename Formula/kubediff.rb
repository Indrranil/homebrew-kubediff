class Kubediff < Formula
  desc "CLI tool to compare Kubernetes resources across clusters"
  homepage "https://github.com/Indrranil/k8s-resource-diff"
  version "1.0.0"

  if OS.mac?
    url "https://github.com/Indrranil/k8s-resource-diff/releases/download/v1.0.0/kubediff-macos-amd64"
    sha256 "6fe7dd3a0756c107ff458823f762dd129eef06de62541883ec4a1e05a48ba8ee"
  elsif OS.linux?
    url "https://github.com/Indrranil/k8s-resource-diff/releases/download/v1.0.0/kubediff-linux-amd64"
    sha256 "f9aa5430d89c471af240fb5711e8f2e6a0922742d0f0aa0c16b5266afff470ae"
  end

  def install
    bin.install "kubediff-macos-amd64" => "kubediff" if OS.mac?
    bin.install "kubediff-linux-amd64" => "kubediff" if OS.linux?
  end

  def caveats
    <<~EOS
      Kubediff is installed. Use 'kubediff --help' to get started.
    EOS
  end

  test do
    assert_match "kubediff", shell_output("#{bin}/kubediff --help")
  end
end
