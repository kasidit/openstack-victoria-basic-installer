#!/bin/bash
grep -o '^[^#]*' ${1} > nocomments/${1}
