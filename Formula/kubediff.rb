class Kubediff < Formula
  desc "CLI tool to compare Kubernetes resources across clusters"
  homepage "https://github.com/Indrranil/k8s-resource-diff"
  version "1.1.0"

  if OS.mac?
    url "https://github.com/Indrranil/k8s-resource-diff/releases/download/v1.1.0/kubediff-macos-amd64"
    sha256 "a00d7d11ff90d1245c3f886381b37d6548c5d79b7fa4cdf162b05131a18369fc"
  elsif OS.linux?
    url "https://github.com/Indrranil/k8s-resource-diff/releases/download/v1.1.0/kubediff-linux-amd64"
    sha256 "e52381d5dff5e333be03b3a65b822fed182bb4cd4174121947bf9b609020631f"
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
