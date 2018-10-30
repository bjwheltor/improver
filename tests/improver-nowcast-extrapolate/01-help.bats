#!/usr/bin/env bats
# -----------------------------------------------------------------------------
# (C) British Crown Copyright 2017-2018 Met Office.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# * Neither the name of the copyright holder nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

@test "extrapolate -h" {
  run improver nowcast-extrapolate -h
  [[ "$status" -eq 0 ]]
  read -d '' expected <<'__TEXT__' || true
usage: improver-nowcast-extrapolate [-h] [--profile]
                                    [--profile_file PROFILE_FILE]
                                    [--output_dir OUTPUT_DIR | --output_filepaths OUTPUT_FILEPATHS [OUTPUT_FILEPATHS ...]]
                                    [--eastward_advection_filepath EASTWARD_ADVECTION_FILEPATH]
                                    [--northward_advection_filepath NORTHWARD_ADVECTION_FILEPATH]
                                    [--json_file JSON_FILE]
                                    [--max_lead_time MAX_LEAD_TIME]
                                    [--lead_time_interval LEAD_TIME_INTERVAL]
                                    INPUT_FILEPATH

Extrapolate input data to required lead times.

positional arguments:
  INPUT_FILEPATH        Path to input NetCDF file.

optional arguments:
  -h, --help            show this help message and exit
  --profile             Switch on profiling information.
  --profile_file PROFILE_FILE
                        Dump profiling info to a file. Implies --profile.
  --output_dir OUTPUT_DIR
                        Directory to write output files.
  --output_filepaths OUTPUT_FILEPATHS [OUTPUT_FILEPATHS ...]
                        List of full paths to output nowcast files, in order
                        of increasing lead time.
  --eastward_advection_filepath EASTWARD_ADVECTION_FILEPATH
                        Path to input file containing Eastward advection
                        velocities.
  --northward_advection_filepath NORTHWARD_ADVECTION_FILEPATH
                        Path to input file containing Northward advection
                        velocities.
  --json_file JSON_FILE
                        Filename for the json file containing required changes
                        to the metadata. Information describing the intended
                        contents of the json file is available in
                        improver.utilities.cube_metadata.amend_metadata.Every
                        output cube will have the metadata_dict applied.
                        Defaults to None.
  --max_lead_time MAX_LEAD_TIME
                        Maximum lead time required (mins).
  --lead_time_interval LEAD_TIME_INTERVAL
                        Interval between required lead times (mins).
__TEXT__
  [[ "$output" =~ "$expected" ]]
}