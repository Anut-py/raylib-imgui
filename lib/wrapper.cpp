#include "wrapper.h"

void rlImGuiImageRect_(const Texture *image, int destWidth, int destHeight, Rectangle *sourceRect) {
    rlImGuiImageRect(image, destWidth, destHeight, *sourceRect);
}
