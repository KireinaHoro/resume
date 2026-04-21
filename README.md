You can find the most-updated version [here](https://jsteward.moe/images/cv.pdf).
The resume PDF is automatically built as part of the [website](https://github.com/KireinaHoro/jsteward.moe).

To build manually, use the Nix Flake:

```console
$ nix build .
$ file result/cv.pdf
result/cv.pdf: PDF document, version 1.7 (zip deflate encoded)
```

The resume template is based on Awesome-CV with modifications.
