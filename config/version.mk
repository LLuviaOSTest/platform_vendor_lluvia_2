# Copyright (C) 2019 Yodita
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Yodita versioning
YODITA_VERSION = 1.0

TARGET_PRODUCT_SHORT := $(subst yodita_,,$(YODITA_BUILD))

YODITA_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
YODITA_MOD_VERSION := Yodita-$(YODITA_VERSION)-$(YODITA_BUILD_DATE)
YODITA_FINGERPRINT := Yodita/$(YODITA_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.yodita.version=$(YODITA_VERSION) \
  ro.modversion=$(YODITA_MOD_VERSION)

YODITA_DISPLAY_VERSION := $(YODITA_VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.yodita.display.version=$(YODITA_DISPLAY_VERSION) \
  ro.yodita.fingerprint=$(YODITA_FINGERPRINT)
