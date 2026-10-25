#include "library_under_test.h"
#include <gtest/gtest.h>

TEST(PublicApi, Version) {
    EXPECT_EQ(lcf::@NAME@::version(), 1);
}
