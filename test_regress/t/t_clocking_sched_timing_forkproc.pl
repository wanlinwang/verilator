#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2023 by Wilson Snyder. This program is free software; you
# can redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
# SPDX-License-Identifier: LGPL-3.0-only OR Artistic-2.0
scenarios(linter => 1);

top_filename("t/t_clocking_sched.v");

lint(
    verilator_flags2 => ["--timing", "--ftaskify-all-forked"],
    expect_filename => $Self->{golden_filename},
    fails => 1,
    );

ok(1);
1;
