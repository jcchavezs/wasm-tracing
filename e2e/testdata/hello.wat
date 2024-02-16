(module
  (type (;0;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32 i32) (result i32)))
  (type (;6;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;7;) (func (param i32 i32 i32)))
  (type (;8;) (func (param i32 i32 i32 i32)))
  (type (;9;) (func (result i32)))
  (type (;10;) (func (result i64)))
  (import "http_handler" "write_body" (func $github.com/http-wasm/http-wasm-guest-tinygo/handler/internal/imports.writeBody (type 7)))
  (import "wasi_snapshot_preview1" "fd_write" (func $runtime.fd_write (type 0)))
  (import "http_handler" "set_span_attribute" (func $set_span_attribute (type 8)))
  (func $runtime.memequal (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 3
    block (result i32)  ;; label = @1
      loop  ;; label = @2
        local.get 2
        local.get 2
        local.get 3
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.get 3
        i32.add
        local.set 4
        local.get 0
        local.get 3
        i32.add
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        i32.load8_u
        local.get 4
        i32.load8_u
        i32.eq
        br_if 0 (;@2;)
      end
      local.get 3
      i32.const 1
      i32.sub
    end
    local.get 2
    i32.ge_u)
  (func $runtime.hash32 (type 0) (param i32 i32 i32 i32) (result i32)
    local.get 1
    i32.const -962287725
    i32.mul
    local.get 2
    i32.xor
    i32.const -1130422988
    i32.xor
    local.set 2
    loop  ;; label = @1
      local.get 1
      i32.const 4
      i32.lt_s
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.load align=1
        local.get 2
        i32.add
        i32.const -962287725
        i32.mul
        local.tee 2
        i32.const 16
        i32.shr_u
        local.get 2
        i32.xor
        local.set 2
        local.get 1
        i32.const 4
        i32.sub
        local.set 1
        local.get 0
        i32.const 4
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 1
            i32.sub
            br_table 2 (;@2;) 1 (;@3;) 0 (;@4;) 3 (;@1;)
          end
          local.get 0
          i32.load8_u offset=2
          i32.const 16
          i32.shl
          local.get 2
          i32.add
          local.set 2
        end
        local.get 0
        i32.load8_u offset=1
        i32.const 8
        i32.shl
        local.get 2
        i32.add
        local.set 2
      end
      local.get 2
      local.get 0
      i32.load8_u
      i32.add
      i32.const -962287725
      i32.mul
      local.tee 0
      i32.const 24
      i32.shr_u
      local.get 0
      i32.xor
      local.set 2
    end
    local.get 2)
  (func $runtime.lookupPanic (type 3)
    i32.const 65665
    i32.const 18
    call $runtime.runtimePanicAt
    unreachable)
  (func $runtime.runtimePanicAt (type 1) (param i32 i32)
    i32.const 65620
    i32.const 22
    call $runtime.printstring
    local.get 0
    local.get 1
    call $runtime.printstring
    i32.const 10
    call $runtime.putchar
    unreachable)
  (func $runtime.slicePanic (type 3)
    i32.const 65683
    i32.const 18
    call $runtime.runtimePanicAt
    unreachable)
  (func $runtime.printstring (type 1) (param i32 i32)
    local.get 1
    i32.const 0
    local.get 1
    i32.const 0
    i32.gt_s
    select
    local.set 1
    loop  ;; label = @1
      local.get 1
      if  ;; label = @2
        local.get 0
        i32.load8_u
        call $runtime.putchar
        local.get 1
        i32.const 1
        i32.sub
        local.set 1
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end)
  (func $runtime.putchar (type 2) (param i32)
    (local i32 i32)
    i32.const 65956
    i32.load
    local.tee 1
    i32.const 119
    i32.le_u
    if  ;; label = @1
      i32.const 65956
      local.get 1
      i32.const 1
      i32.add
      local.tee 2
      i32.store
      local.get 1
      i32.const 65960
      i32.add
      local.get 0
      i32.store8
      local.get 0
      i32.const 255
      i32.and
      i32.const 10
      i32.ne
      local.get 1
      i32.const 119
      i32.ne
      i32.and
      i32.eqz
      if  ;; label = @2
        i32.const 65904
        local.get 2
        i32.store
        i32.const 1
        i32.const 65900
        i32.const 1
        i32.const 66128
        call $runtime.fd_write
        drop
        i32.const 65956
        i32.const 0
        i32.store
      end
      return
    end
    call $runtime.lookupPanic
    unreachable)
  (func $runtime.alloc (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 66120
      return
    end
    i32.const 66096
    i32.const 66096
    i64.load
    local.get 0
    i64.extend_i32_u
    i64.add
    i64.store
    i32.const 66104
    i32.const 66104
    i64.load
    i64.const 1
    i64.add
    i64.store
    local.get 0
    i32.const 15
    i32.add
    i32.const 4
    i32.shr_u
    local.set 5
    i32.const 66084
    i32.load
    local.tee 4
    local.set 3
    loop  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              local.get 4
              i32.ne
              if  ;; label = @6
                local.get 2
                local.set 1
                br 1 (;@5;)
              end
              i32.const 1
              local.set 1
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  i32.const 255
                  i32.and
                  br_table 2 (;@5;) 0 (;@7;) 1 (;@6;)
                end
                i32.const 66124
                i32.load
                drop
                global.get $__stack_pointer
                i32.const 65536
                call $runtime.markRoots
                i32.const 65536
                i32.const 66416
                call $runtime.markRoots
                loop  ;; label = @7
                  i32.const 66121
                  i32.load8_u
                  i32.eqz
                  if  ;; label = @8
                    i32.const 0
                    local.set 2
                    i32.const 0
                    local.set 4
                    i32.const 0
                    local.set 1
                    loop  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 66088
                          i32.load
                          local.get 1
                          i32.gt_u
                          if  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 1
                                    call $_runtime.gcBlock_.state
                                    i32.const 255
                                    i32.and
                                    i32.const 1
                                    i32.sub
                                    br_table 0 (;@16;) 1 (;@15;) 2 (;@14;) 3 (;@13;)
                                  end
                                  local.get 1
                                  call $_runtime.gcBlock_.markFree
                                  i32.const 66112
                                  i32.const 66112
                                  i64.load
                                  i64.const 1
                                  i64.add
                                  i64.store
                                  br 4 (;@11;)
                                end
                                local.get 4
                                i32.const 1
                                i32.and
                                i32.const 0
                                local.set 4
                                i32.eqz
                                br_if 4 (;@10;)
                                local.get 1
                                call $_runtime.gcBlock_.markFree
                                br 3 (;@11;)
                              end
                              i32.const 0
                              local.set 4
                              i32.const 66080
                              i32.load
                              local.get 1
                              i32.const 2
                              i32.shr_u
                              i32.add
                              local.tee 6
                              local.get 6
                              i32.load8_u
                              i32.const 2
                              local.get 1
                              i32.const 1
                              i32.shl
                              i32.const 6
                              i32.and
                              i32.shl
                              i32.const -1
                              i32.xor
                              i32.and
                              i32.store8
                              br 3 (;@10;)
                            end
                            local.get 2
                            i32.const 16
                            i32.add
                            local.set 2
                            br 2 (;@10;)
                          end
                          i32.const 2
                          local.set 1
                          local.get 2
                          i32.const 66080
                          i32.load
                          i32.const 66416
                          i32.sub
                          i32.const 3
                          i32.div_u
                          i32.ge_u
                          br_if 6 (;@5;)
                          call $runtime.growHeap
                          drop
                          br 6 (;@5;)
                        end
                        local.get 2
                        i32.const 16
                        i32.add
                        local.set 2
                        i32.const 1
                        local.set 4
                      end
                      local.get 1
                      i32.const 1
                      i32.add
                      local.set 1
                      br 0 (;@9;)
                    end
                    unreachable
                  end
                  i32.const 0
                  local.set 1
                  i32.const 66121
                  i32.const 0
                  i32.store8
                  i32.const 66088
                  i32.load
                  local.set 2
                  loop  ;; label = @8
                    local.get 1
                    local.get 2
                    i32.ge_u
                    br_if 1 (;@7;)
                    local.get 1
                    call $_runtime.gcBlock_.state
                    i32.const 255
                    i32.and
                    i32.const 3
                    i32.eq
                    if  ;; label = @9
                      local.get 1
                      call $runtime.startMark
                      i32.const 66088
                      i32.load
                      local.set 2
                    end
                    local.get 1
                    i32.const 1
                    i32.add
                    local.set 1
                    br 0 (;@8;)
                  end
                  unreachable
                end
                unreachable
              end
              local.get 2
              local.set 1
              call $runtime.growHeap
              i32.const 1
              i32.and
              i32.eqz
              br_if 1 (;@4;)
            end
            i32.const 66088
            i32.load
            local.get 3
            i32.eq
            if  ;; label = @5
              i32.const 0
              local.set 3
              br 2 (;@3;)
            end
            local.get 3
            call $_runtime.gcBlock_.state
            i32.const 255
            i32.and
            if  ;; label = @5
              local.get 3
              i32.const 1
              i32.add
              local.set 3
              br 2 (;@3;)
            end
            local.get 3
            i32.const 1
            i32.add
            local.set 2
            local.get 5
            local.get 7
            i32.const 1
            i32.add
            local.tee 7
            i32.ne
            if  ;; label = @5
              local.get 2
              local.set 3
              br 3 (;@2;)
            end
            i32.const 66084
            local.get 2
            i32.store
            local.get 2
            local.get 5
            i32.sub
            local.tee 2
            i32.const 1
            call $_runtime.gcBlock_.setState
            local.get 3
            local.get 5
            i32.sub
            i32.const 2
            i32.add
            local.set 1
            loop  ;; label = @5
              i32.const 66084
              i32.load
              local.get 1
              i32.ne
              if  ;; label = @6
                local.get 1
                i32.const 2
                call $_runtime.gcBlock_.setState
                local.get 1
                i32.const 1
                i32.add
                local.set 1
                br 1 (;@5;)
              end
            end
            local.get 2
            i32.const 4
            i32.shl
            i32.const 66416
            i32.add
            local.tee 2
            i32.const 0
            local.get 0
            memory.fill
            local.get 2
            return
          end
          i32.const 65600
          i32.const 13
          call $runtime.runtimePanicAt
          unreachable
        end
        i32.const 0
        local.set 7
      end
      i32.const 66084
      i32.load
      local.set 4
      local.get 1
      local.set 2
      br 0 (;@1;)
    end
    unreachable)
  (func $runtime.markRoots (type 1) (param i32 i32)
    (local i32)
    loop  ;; label = @1
      local.get 0
      local.get 1
      i32.ge_u
      i32.eqz
      if  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 2
          i32.const 66416
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          i32.const 66080
          i32.load
          i32.ge_u
          br_if 0 (;@3;)
          local.get 2
          i32.const 66416
          i32.sub
          i32.const 4
          i32.shr_u
          local.tee 2
          call $_runtime.gcBlock_.state
          i32.const 255
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          call $_runtime.gcBlock_.findHead
          local.tee 2
          call $_runtime.gcBlock_.state
          i32.const 255
          i32.and
          i32.const 3
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          call $runtime.startMark
        end
        local.get 0
        i32.const 4
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end)
  (func $_runtime.gcBlock_.state (type 4) (param i32) (result i32)
    i32.const 66080
    i32.load
    local.get 0
    i32.const 2
    i32.shr_u
    i32.add
    i32.load8_u
    local.get 0
    i32.const 1
    i32.shl
    i32.const 6
    i32.and
    i32.shr_u
    i32.const 3
    i32.and)
  (func $_runtime.gcBlock_.markFree (type 2) (param i32)
    (local i32)
    i32.const 66080
    i32.load
    local.get 0
    i32.const 2
    i32.shr_u
    i32.add
    local.tee 1
    local.get 1
    i32.load8_u
    i32.const 3
    local.get 0
    i32.const 1
    i32.shl
    i32.const 6
    i32.and
    i32.shl
    i32.const -1
    i32.xor
    i32.and
    i32.store8)
  (func $runtime.growHeap (type 9) (result i32)
    (local i32 i32 i32)
    memory.size
    memory.grow
    i32.const -1
    i32.ne
    local.tee 1
    if  ;; label = @1
      memory.size
      local.set 0
      i32.const 65952
      i32.load
      local.set 2
      i32.const 65952
      local.get 0
      i32.const 16
      i32.shl
      i32.store
      i32.const 66080
      i32.load
      local.set 0
      call $runtime.calculateHeapAddresses
      i32.const 66080
      i32.load
      local.get 0
      local.get 2
      local.get 0
      i32.sub
      memory.copy
    end
    local.get 1)
  (func $runtime.startMark (type 2) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const -64
    i32.add
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 4
    i32.add
    i32.const 0
    i32.const 60
    memory.fill
    local.get 4
    local.get 0
    i32.store
    local.get 0
    i32.const 3
    call $_runtime.gcBlock_.setState
    i32.const 1
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const 0
        i32.gt_s
        if  ;; label = @3
          local.get 1
          i32.const 1
          i32.sub
          local.tee 1
          i32.const 15
          i32.gt_u
          br_if 2 (;@1;)
          local.get 4
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 3
          i32.const 4
          i32.shl
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              call $_runtime.gcBlock_.state
              i32.const 255
              i32.and
              i32.const 1
              i32.sub
              br_table 0 (;@5;) 1 (;@4;) 0 (;@5;) 1 (;@4;)
            end
            local.get 3
            i32.const 1
            i32.add
            local.set 3
          end
          local.get 0
          i32.const 66416
          i32.add
          local.set 6
          local.get 3
          i32.const 4
          i32.shl
          local.tee 5
          local.get 0
          i32.sub
          local.set 2
          local.get 5
          i32.const 66416
          i32.add
          local.set 5
          i32.const 66080
          i32.load
          local.set 7
          loop  ;; label = @4
            block  ;; label = @5
              local.get 2
              local.set 0
              local.get 5
              local.get 7
              i32.ge_u
              br_if 0 (;@5;)
              local.get 0
              i32.const 16
              i32.add
              local.set 2
              local.get 5
              i32.const 16
              i32.add
              local.set 5
              local.get 3
              call $_runtime.gcBlock_.state
              local.get 3
              i32.const 1
              i32.add
              local.set 3
              i32.const 255
              i32.and
              i32.const 2
              i32.eq
              br_if 1 (;@4;)
            end
          end
          loop  ;; label = @4
            local.get 0
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              local.get 6
              i32.load
              local.tee 2
              i32.const 66416
              i32.lt_u
              br_if 0 (;@5;)
              local.get 2
              i32.const 66080
              i32.load
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              i32.const 66416
              i32.sub
              i32.const 4
              i32.shr_u
              local.tee 2
              call $_runtime.gcBlock_.state
              i32.const 255
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              call $_runtime.gcBlock_.findHead
              local.tee 2
              call $_runtime.gcBlock_.state
              i32.const 255
              i32.and
              i32.const 3
              i32.eq
              br_if 0 (;@5;)
              local.get 2
              i32.const 3
              call $_runtime.gcBlock_.setState
              local.get 1
              i32.const 16
              i32.eq
              if  ;; label = @6
                i32.const 66121
                i32.const 1
                i32.store8
                i32.const 16
                local.set 1
                br 1 (;@5;)
              end
              local.get 1
              i32.const 15
              i32.gt_u
              br_if 4 (;@1;)
              local.get 4
              local.get 1
              i32.const 2
              i32.shl
              i32.add
              local.get 2
              i32.store
              local.get 1
              i32.const 1
              i32.add
              local.set 1
            end
            local.get 0
            i32.const 4
            i32.sub
            local.set 0
            local.get 6
            i32.const 4
            i32.add
            local.set 6
            br 0 (;@4;)
          end
          unreachable
        end
      end
      local.get 4
      i32.const -64
      i32.sub
      global.set $__stack_pointer
      return
    end
    call $runtime.lookupPanic
    unreachable)
  (func $_runtime.gcBlock_.setState (type 1) (param i32 i32)
    (local i32)
    i32.const 66080
    i32.load
    local.get 0
    i32.const 2
    i32.shr_u
    i32.add
    local.tee 2
    local.get 2
    i32.load8_u
    local.get 1
    local.get 0
    i32.const 1
    i32.shl
    i32.const 6
    i32.and
    i32.shl
    i32.or
    i32.store8)
  (func $runtime.nilPanic (type 3)
    i32.const 65642
    i32.const 23
    call $runtime.runtimePanicAt
    unreachable)
  (func $runtime.calculateHeapAddresses (type 3)
    (local i32)
    i32.const 66080
    i32.const 65952
    i32.load
    local.tee 0
    local.get 0
    i32.const 66352
    i32.sub
    i32.const 65
    i32.div_u
    i32.sub
    local.tee 0
    i32.store
    i32.const 66088
    local.get 0
    i32.const 66416
    i32.sub
    i32.const 4
    i32.shr_u
    i32.store)
  (func $_runtime.gcBlock_.findHead (type 4) (param i32) (result i32)
    (local i32)
    loop  ;; label = @1
      local.get 0
      call $_runtime.gcBlock_.state
      local.get 0
      i32.const 1
      i32.sub
      local.set 0
      i32.const 255
      i32.and
      i32.const 2
      i32.eq
      br_if 0 (;@1;)
    end
    local.get 0
    i32.const 1
    i32.add)
  (func $malloc (type 4) (param i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 2
    i32.store offset=20
    i32.const 66124
    i32.load
    local.set 3
    i32.const 66124
    local.get 1
    i32.const 16
    i32.add
    i32.store
    local.get 1
    local.get 3
    i32.store offset=16
    block  ;; label = @1
      local.get 0
      if  ;; label = @2
        local.get 0
        i32.const 0
        i32.lt_s
        br_if 1 (;@1;)
        local.get 1
        local.get 0
        call $runtime.alloc
        local.tee 2
        i32.store offset=24
        local.get 1
        local.get 2
        i32.store offset=28
        local.get 1
        local.get 0
        i32.store offset=8
        local.get 1
        local.get 0
        i32.store offset=4
        local.get 1
        local.get 2
        i32.store
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 1
        i32.const 12
        i32.add
        local.get 1
        call $runtime.hashmapBinarySet
      end
      i32.const 66124
      local.get 3
      i32.store
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 2
      return
    end
    call $runtime.slicePanic
    unreachable)
  (func $runtime.hashmapBinarySet (type 1) (param i32 i32)
    i32.const 65908
    local.get 0
    local.get 1
    local.get 0
    i32.const 65920
    i32.load
    i32.const 65912
    i32.load
    local.get 0
    call $runtime.hash32
    call $runtime.hashmapSet)
  (func $free (type 2) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      if  ;; label = @2
        local.get 1
        local.get 0
        i32.store offset=12
        local.get 1
        i32.const 12
        i32.add
        local.get 1
        call $runtime.hashmapBinaryGet
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 0
        i32.store
        local.get 1
        call $runtime.hashmapBinaryDelete
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 65560
    call $runtime._panic
    unreachable)
  (func $runtime.hashmapBinaryGet (type 5) (param i32 i32) (result i32)
    i32.const 65908
    local.get 0
    local.get 1
    local.get 0
    i32.const 65920
    i32.load
    i32.const 65912
    i32.load
    local.get 0
    call $runtime.hash32
    call $runtime.hashmapGet)
  (func $runtime.hashmapBinaryDelete (type 2) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 24
    i32.add
    i64.const 0
    i64.store
    local.get 1
    i64.const 0
    i64.store offset=16
    local.get 1
    i32.const 6
    i32.store offset=4
    i32.const 66124
    i32.load
    local.set 4
    i32.const 66124
    local.get 1
    i32.store
    local.get 1
    local.get 4
    i32.store
    local.get 0
    i32.const 65920
    i32.load
    i32.const 65912
    i32.load
    i32.const 0
    call $runtime.hash32
    local.tee 2
    i32.const 24
    i32.shr_u
    local.tee 3
    i32.const 1
    local.get 3
    select
    local.set 7
    i32.const 65908
    local.get 2
    call $runtime.hashmapBucketAddrForHash
    local.set 2
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.get 2
        i32.store offset=8
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        i32.const 0
        local.set 3
        block  ;; label = @3
          loop  ;; label = @4
            local.get 3
            i32.const 8
            i32.ne
            if  ;; label = @5
              local.get 1
              i32.const 65920
              i32.load
              local.tee 8
              local.get 3
              i32.mul
              local.get 2
              i32.add
              i32.const 12
              i32.add
              local.tee 5
              i32.store offset=16
              block  ;; label = @6
                local.get 2
                local.get 3
                i32.add
                local.tee 9
                i32.load8_u
                local.get 7
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                i32.const 65932
                i32.load
                local.tee 10
                i32.store offset=20
                local.get 1
                i32.const 65936
                i32.load
                local.tee 6
                i32.store offset=24
                local.get 6
                i32.eqz
                br_if 3 (;@3;)
                local.get 0
                local.get 5
                local.get 8
                local.get 10
                local.get 6
                call_indirect (type 0)
                i32.const 1
                i32.and
                i32.eqz
                br_if 0 (;@6;)
                local.get 9
                i32.const 0
                i32.store8
                local.get 5
                i32.const 0
                i32.const 65920
                i32.load
                memory.fill
                i32.const 65924
                i32.load
                local.tee 0
                local.get 3
                i32.mul
                i32.const 65920
                i32.load
                i32.const 3
                i32.shl
                i32.add
                local.get 2
                i32.add
                i32.const 12
                i32.add
                i32.const 0
                local.get 0
                memory.fill
                i32.const 65916
                i32.const 65916
                i32.load
                i32.const 1
                i32.sub
                i32.store
                br 5 (;@1;)
              end
              local.get 3
              i32.const 1
              i32.add
              local.set 3
              br 1 (;@4;)
            end
          end
          local.get 2
          i32.load offset=8
          local.set 2
          br 1 (;@2;)
        end
      end
      call $runtime.nilPanic
      unreachable
    end
    i32.const 66124
    local.get 4
    i32.store
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $runtime._panic (type 2) (param i32)
    i32.const 65613
    i32.const 7
    call $runtime.printstring
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $runtime.printstring
    i32.const 10
    call $runtime.putchar
    unreachable)
  (func $calloc (type 5) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 66124
    i32.load
    local.set 3
    i32.const 66124
    local.get 2
    i32.store
    local.get 0
    local.get 1
    i32.mul
    call $malloc
    i32.const 66124
    local.get 3
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $realloc (type 5) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 2
    i32.store offset=20
    i32.const 66124
    i32.load
    local.set 4
    i32.const 66124
    local.get 2
    i32.const 16
    i32.add
    i32.store
    local.get 2
    local.get 4
    i32.store offset=16
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          if  ;; label = @4
            local.get 0
            call $free
            br 1 (;@3;)
          end
          local.get 1
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          local.get 2
          local.get 1
          call $runtime.alloc
          local.tee 3
          i32.store offset=24
          local.get 2
          local.get 3
          i32.store offset=28
          local.get 0
          if  ;; label = @4
            local.get 2
            local.get 0
            i32.store offset=12
            local.get 2
            i32.const 12
            i32.add
            local.get 2
            call $runtime.hashmapBinaryGet
            i32.const 1
            i32.and
            i32.eqz
            br_if 3 (;@1;)
            local.get 3
            local.get 2
            i32.load
            local.get 2
            i32.load offset=4
            local.tee 5
            local.get 1
            local.get 1
            local.get 5
            i32.gt_u
            select
            memory.copy
            local.get 2
            local.get 0
            i32.store
            local.get 2
            call $runtime.hashmapBinaryDelete
          end
          local.get 2
          local.get 1
          i32.store offset=8
          local.get 2
          local.get 1
          i32.store offset=4
          local.get 2
          local.get 3
          i32.store
          local.get 2
          local.get 3
          i32.store offset=12
          local.get 2
          i32.const 12
          i32.add
          local.get 2
          call $runtime.hashmapBinarySet
        end
        i32.const 66124
        local.get 4
        i32.store
        local.get 2
        i32.const 32
        i32.add
        global.set $__stack_pointer
        local.get 3
        return
      end
      call $runtime.slicePanic
      unreachable
    end
    i32.const 65592
    call $runtime._panic
    unreachable)
  (func $_start (type 3)
    (local i32 i32)
    i32.const 65952
    memory.size
    i32.const 16
    i32.shl
    local.tee 0
    i32.store
    call $runtime.calculateHeapAddresses
    i32.const 66080
    i32.load
    local.tee 1
    i32.const 0
    local.get 0
    local.get 1
    i32.sub
    memory.fill
    i32.const 65952
    memory.size
    i32.const 16
    i32.shl
    i32.store
    i32.const 66412
    i32.const 1
    i32.store8)
  (func $runtime.hashmapGet (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 32
    i32.add
    i64.const 0
    i64.store
    local.get 4
    i32.const 40
    i32.add
    i32.const 0
    i32.store
    local.get 4
    i64.const 0
    i64.store offset=24
    local.get 4
    i32.const 7
    i32.store offset=12
    i32.const 66124
    i32.load
    local.set 6
    i32.const 66124
    local.get 4
    i32.const 8
    i32.add
    i32.store
    local.get 4
    local.get 6
    i32.store offset=8
    local.get 4
    local.get 0
    local.get 3
    call $runtime.hashmapBucketAddrForHash
    local.tee 5
    i32.store offset=16
    local.get 3
    i32.const 24
    i32.shr_u
    local.tee 3
    i32.const 1
    local.get 3
    select
    local.set 9
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 4
            local.get 5
            i32.store offset=20
            local.get 5
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 3
            loop  ;; label = @5
              local.get 3
              i32.const 8
              i32.ne
              if  ;; label = @6
                local.get 4
                local.get 0
                i32.load offset=12
                local.tee 7
                local.get 3
                i32.mul
                local.get 5
                i32.add
                i32.const 12
                i32.add
                local.tee 10
                i32.store offset=24
                local.get 4
                local.get 0
                i32.load offset=16
                local.get 3
                i32.mul
                local.get 7
                i32.const 3
                i32.shl
                i32.add
                local.get 5
                i32.add
                i32.const 12
                i32.add
                local.tee 11
                i32.store offset=28
                block  ;; label = @7
                  local.get 3
                  local.get 5
                  i32.add
                  i32.load8_u
                  local.get 9
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 0
                  i32.load offset=24
                  local.tee 12
                  i32.store offset=32
                  local.get 4
                  local.get 0
                  i32.load offset=28
                  local.tee 8
                  i32.store offset=36
                  local.get 8
                  i32.eqz
                  br_if 6 (;@1;)
                  local.get 1
                  local.get 10
                  local.get 7
                  local.get 12
                  local.get 8
                  call_indirect (type 0)
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 11
                  local.get 0
                  i32.load offset=16
                  memory.copy
                  br 5 (;@2;)
                end
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                br 1 (;@5;)
              end
            end
            local.get 4
            local.get 5
            i32.load offset=8
            local.tee 5
            i32.store offset=40
            br 1 (;@3;)
          end
        end
        local.get 2
        i32.const 0
        local.get 0
        i32.load offset=16
        memory.fill
      end
      i32.const 66124
      local.get 6
      i32.store
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      local.get 5
      i32.const 0
      i32.ne
      return
    end
    call $runtime.nilPanic
    unreachable)
  (func $runtime.hashmapBucketAddrForHash (type 5) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load offset=12
    i32.add
    i32.const 3
    i32.shl
    i32.const 12
    i32.add
    i32.const -1
    i32.const -1
    local.get 0
    i32.load8_u offset=20
    local.tee 0
    i32.shl
    i32.const -1
    i32.xor
    local.get 0
    i32.const 31
    i32.gt_u
    select
    local.get 1
    i32.and
    i32.mul
    i32.add)
  (func $runtime.hashmapSet (type 8) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 272
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 55
    i32.store offset=44
    local.get 4
    i32.const 48
    i32.add
    i32.const 0
    i32.const 220
    memory.fill
    local.get 4
    i32.const 66124
    i32.load
    local.tee 15
    i32.store offset=40
    i32.const 66124
    local.get 4
    i32.const 40
    i32.add
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          i32.load8_u offset=20
          local.tee 5
          i32.const 29
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=8
          i32.const 6
          local.get 5
          i32.shl
          i32.le_u
          br_if 0 (;@3;)
          local.get 4
          i64.const 0
          i64.store offset=16
          local.get 4
          local.get 0
          i32.load offset=36
          local.tee 3
          i32.store offset=64
          local.get 4
          local.get 0
          i32.load offset=32
          local.tee 7
          i32.store offset=60
          local.get 4
          local.get 0
          i32.load offset=28
          local.tee 6
          i32.store offset=56
          local.get 4
          local.get 0
          i32.load offset=24
          local.tee 8
          i32.store offset=52
          local.get 4
          local.get 0
          i32.load
          i32.store offset=48
          local.get 4
          local.get 3
          i32.store offset=36
          local.get 4
          local.get 7
          i32.store offset=32
          local.get 4
          local.get 6
          i32.store offset=28
          local.get 4
          local.get 8
          i32.store offset=24
          local.get 4
          local.get 0
          i32.load offset=16
          i32.store offset=16
          local.get 4
          local.get 0
          i32.load offset=12
          i32.store offset=12
          i32.const 65896
          i32.const 65896
          i32.load
          local.tee 3
          i32.const 7
          i32.shl
          local.get 3
          i32.xor
          local.tee 3
          i32.const 1
          i32.shr_u
          local.get 3
          i32.xor
          local.tee 3
          i32.const 9
          i32.shl
          local.get 3
          i32.xor
          local.tee 3
          i32.store
          local.get 4
          i32.const 0
          i32.store offset=8
          local.get 4
          local.get 3
          i32.store offset=4
          local.get 4
          local.get 5
          i32.const 1
          i32.add
          local.tee 3
          i32.store8 offset=20
          local.get 4
          local.get 0
          i32.load offset=16
          local.get 0
          i32.load offset=12
          i32.add
          i32.const 3
          i32.shl
          i32.const 12
          i32.add
          local.get 3
          i32.shl
          call $runtime.alloc
          local.tee 3
          i32.store
          local.get 4
          local.get 3
          i32.store offset=68
          local.get 4
          local.get 0
          i32.load offset=12
          call $runtime.alloc
          local.tee 8
          i32.store offset=72
          local.get 4
          local.get 0
          i32.load offset=16
          call $runtime.alloc
          local.tee 12
          i32.store offset=76
          i32.const 0
          local.set 7
          i32.const 0
          local.set 3
          i32.const 0
          local.set 6
          i32.const 0
          local.set 5
          loop  ;; label = @4
            local.get 4
            local.get 5
            i32.store offset=80
            local.get 5
            i32.eqz
            if  ;; label = @5
              local.get 4
              local.get 0
              i32.load
              local.tee 5
              i32.store offset=84
              i32.const 1
              local.get 0
              i32.load8_u offset=20
              local.tee 9
              i32.shl
              i32.const 0
              local.get 9
              i32.const 31
              i32.le_u
              select
              local.set 13
            end
            local.get 4
            local.get 5
            i32.store offset=100
            local.get 4
            local.get 5
            i32.store offset=120
            block  ;; label = @5
              loop  ;; label = @6
                local.get 4
                local.get 3
                i32.store offset=88
                local.get 6
                i32.const 255
                i32.and
                i32.const 8
                i32.ge_u
                if  ;; label = @7
                  local.get 3
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 4
                  local.get 3
                  i32.load offset=8
                  local.tee 3
                  i32.store offset=92
                  i32.const 0
                  local.set 6
                end
                local.get 4
                local.get 3
                i32.store offset=96
                local.get 3
                i32.eqz
                if  ;; label = @7
                  local.get 7
                  local.get 13
                  i32.ge_u
                  br_if 2 (;@5;)
                  local.get 4
                  local.get 5
                  local.get 0
                  i32.load offset=16
                  local.get 0
                  i32.load offset=12
                  i32.add
                  i32.const 3
                  i32.shl
                  i32.const 12
                  i32.add
                  local.get 7
                  i32.mul
                  i32.add
                  local.tee 3
                  i32.store offset=104
                  local.get 7
                  i32.const 1
                  i32.add
                  local.set 7
                end
                local.get 4
                local.get 3
                i32.store offset=112
                local.get 4
                local.get 3
                i32.store offset=128
                local.get 4
                local.get 3
                i32.store offset=108
                local.get 3
                i32.eqz
                br_if 4 (;@2;)
                local.get 3
                local.get 6
                i32.const 255
                i32.and
                local.tee 10
                i32.add
                i32.load8_u
                i32.eqz
                if  ;; label = @7
                  local.get 6
                  i32.const 1
                  i32.add
                  local.set 6
                  br 1 (;@6;)
                end
                local.get 4
                local.get 0
                i32.load offset=12
                local.tee 9
                local.get 10
                i32.mul
                local.get 3
                i32.add
                i32.const 12
                i32.add
                local.tee 11
                i32.store offset=116
                local.get 8
                local.get 11
                local.get 9
                memory.copy
                local.get 4
                local.get 0
                i32.load
                local.tee 11
                i32.store offset=124
                block  ;; label = @7
                  local.get 5
                  local.get 11
                  i32.eq
                  if  ;; label = @8
                    local.get 4
                    local.get 10
                    local.get 0
                    i32.load offset=16
                    local.tee 10
                    i32.mul
                    local.get 9
                    i32.const 3
                    i32.shl
                    i32.add
                    local.get 3
                    i32.add
                    i32.const 12
                    i32.add
                    local.tee 9
                    i32.store offset=132
                    local.get 12
                    local.get 9
                    local.get 10
                    memory.copy
                    local.get 6
                    i32.const 1
                    i32.add
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 4
                  local.get 0
                  i32.load offset=32
                  local.tee 11
                  i32.store offset=136
                  local.get 4
                  local.get 0
                  i32.load offset=36
                  local.tee 10
                  i32.store offset=140
                  local.get 10
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 6
                  i32.const 1
                  i32.add
                  local.set 6
                  local.get 0
                  local.get 8
                  local.get 12
                  local.get 8
                  local.get 9
                  local.get 0
                  i32.load offset=4
                  local.get 11
                  local.get 10
                  call_indirect (type 0)
                  call $runtime.hashmapGet
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 1 (;@6;)
                end
              end
              local.get 4
              local.get 4
              i32.load offset=32
              local.tee 10
              i32.store offset=144
              local.get 4
              local.get 4
              i32.load offset=36
              local.tee 9
              i32.store offset=148
              local.get 9
              i32.eqz
              br_if 3 (;@2;)
              local.get 4
              local.get 8
              local.get 12
              local.get 8
              local.get 4
              i32.load offset=12
              local.get 4
              i32.load offset=4
              local.get 10
              local.get 9
              call_indirect (type 0)
              call $runtime.hashmapSet
              br 1 (;@4;)
            end
          end
          local.get 0
          local.get 4
          i32.load
          local.tee 3
          i32.store
          local.get 0
          local.get 4
          i64.load offset=4 align=4
          i64.store offset=4 align=4
          local.get 0
          local.get 4
          i64.load offset=12 align=4
          i64.store offset=12 align=4
          local.get 0
          local.get 4
          i32.load8_u offset=20
          i32.store8 offset=20
          local.get 0
          local.get 4
          i32.load offset=24
          local.tee 5
          i32.store offset=24
          local.get 0
          local.get 4
          i32.load offset=28
          local.tee 7
          i32.store offset=28
          local.get 0
          local.get 4
          i32.load offset=32
          local.tee 6
          i32.store offset=32
          local.get 0
          local.get 4
          i32.load offset=36
          local.tee 8
          i32.store offset=36
          local.get 4
          local.get 3
          i32.store offset=152
          local.get 4
          local.get 5
          i32.store offset=156
          local.get 4
          local.get 7
          i32.store offset=160
          local.get 4
          local.get 6
          i32.store offset=164
          local.get 4
          local.get 8
          i32.store offset=168
          local.get 4
          local.get 0
          i32.load offset=32
          local.tee 5
          i32.store offset=172
          local.get 4
          local.get 0
          i32.load offset=36
          local.tee 3
          i32.store offset=176
          local.get 3
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          local.get 0
          i32.load offset=12
          local.get 0
          i32.load offset=4
          local.get 5
          local.get 3
          call_indirect (type 0)
          local.set 3
        end
        local.get 4
        local.get 0
        local.get 3
        call $runtime.hashmapBucketAddrForHash
        local.tee 7
        i32.store offset=180
        local.get 3
        i32.const 24
        i32.shr_u
        local.tee 3
        i32.const 1
        local.get 3
        select
        local.set 9
        i32.const 0
        local.set 3
        i32.const 0
        local.set 6
        i32.const 0
        local.set 12
        i32.const 0
        local.set 8
        loop  ;; label = @3
          block  ;; label = @4
            local.get 4
            local.get 3
            i32.store offset=196
            local.get 4
            local.get 7
            local.tee 5
            i32.store offset=200
            local.get 4
            local.get 6
            i32.store offset=192
            local.get 4
            local.get 12
            i32.store offset=188
            local.get 4
            local.get 8
            i32.store offset=184
            local.get 5
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 3
            loop  ;; label = @5
              block  ;; label = @6
                local.get 4
                local.get 12
                i32.store offset=208
                local.get 4
                local.get 6
                i32.store offset=212
                local.get 4
                local.get 8
                i32.store offset=204
                local.get 3
                i32.const 8
                i32.eq
                br_if 0 (;@6;)
                local.get 4
                local.get 0
                i32.load offset=12
                local.tee 7
                local.get 3
                i32.mul
                local.get 5
                i32.add
                i32.const 12
                i32.add
                local.tee 13
                i32.store offset=216
                local.get 4
                local.get 0
                i32.load offset=16
                local.get 3
                i32.mul
                local.get 7
                i32.const 3
                i32.shl
                i32.add
                local.get 5
                i32.add
                i32.const 12
                i32.add
                local.tee 10
                i32.store offset=220
                local.get 4
                local.get 6
                local.get 13
                local.get 3
                local.get 5
                i32.add
                local.tee 11
                i32.load8_u
                local.get 6
                i32.or
                local.tee 14
                select
                local.tee 6
                i32.store offset=232
                local.get 4
                local.get 8
                local.get 11
                local.get 14
                select
                local.tee 8
                i32.store offset=224
                local.get 4
                local.get 12
                local.get 10
                local.get 14
                select
                local.tee 12
                i32.store offset=228
                block  ;; label = @7
                  local.get 11
                  i32.load8_u
                  local.get 9
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 0
                  i32.load offset=24
                  local.tee 14
                  i32.store offset=236
                  local.get 4
                  local.get 0
                  i32.load offset=28
                  local.tee 11
                  i32.store offset=240
                  local.get 11
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 1
                  local.get 13
                  local.get 7
                  local.get 14
                  local.get 11
                  call_indirect (type 0)
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 10
                  local.get 2
                  local.get 0
                  i32.load offset=16
                  memory.copy
                  br 6 (;@1;)
                end
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                br 1 (;@5;)
              end
            end
            local.get 4
            local.get 5
            i32.load offset=8
            local.tee 7
            i32.store offset=244
            local.get 5
            local.set 3
            br 1 (;@3;)
          end
        end
        local.get 6
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.load offset=16
          local.get 0
          i32.load offset=12
          i32.add
          i32.const 3
          i32.shl
          i32.const 12
          i32.add
          call $runtime.alloc
          local.set 5
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          local.get 4
          local.get 5
          i32.store offset=252
          local.get 4
          local.get 5
          i32.store offset=264
          local.get 4
          local.get 5
          i32.store offset=248
          local.get 4
          local.get 5
          i32.const 12
          i32.add
          local.tee 7
          i32.store offset=256
          local.get 4
          local.get 7
          local.get 0
          i32.load offset=12
          local.tee 6
          i32.const 3
          i32.shl
          i32.add
          local.tee 8
          i32.store offset=260
          local.get 7
          local.get 1
          local.get 6
          memory.copy
          local.get 8
          local.get 2
          local.get 0
          i32.load offset=16
          memory.copy
          local.get 5
          local.get 9
          i32.store8
          local.get 3
          i32.eqz
          br_if 1 (;@2;)
          local.get 3
          local.get 5
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 0
        local.get 0
        i32.load offset=8
        i32.const 1
        i32.add
        i32.store offset=8
        local.get 6
        local.get 1
        local.get 0
        i32.load offset=12
        memory.copy
        local.get 12
        local.get 2
        local.get 0
        i32.load offset=16
        memory.copy
        local.get 8
        i32.eqz
        br_if 0 (;@2;)
        local.get 8
        local.get 9
        i32.store8
        br 1 (;@1;)
      end
      call $runtime.nilPanic
      unreachable
    end
    i32.const 66124
    local.get 15
    i32.store
    local.get 4
    i32.const 272
    i32.add
    global.set $__stack_pointer)
  (func $github.com/http-wasm/http-wasm-guest-tinygo/handler.init$1 (type 6) (param i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.const 0
    i32.store offset=4
    local.get 0
    i32.const 1
    i32.store8)
  (func $handle_request (type 10) (result i64)
    (local i32 i32 i32 i64 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i64.const 2
    i64.store offset=20 align=4
    i32.const 66124
    i32.load
    local.set 1
    i32.const 66124
    local.get 0
    i32.const 16
    i32.add
    i32.store
    local.get 0
    local.get 1
    i32.store offset=16
    local.get 0
    i32.const 1
    i32.const 2
    i32.const 66412
    i32.load8_u
    select
    local.tee 2
    i32.store offset=28
    local.get 2
    if  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      i32.const 65804
      i32.const 0
      i32.const 65840
      i32.const 0
      i32.const 0
      local.get 2
      call_indirect (type 6)
      i32.const 66124
      local.get 1
      i32.store
      local.get 0
      i64.load32_u offset=12
      local.set 3
      local.get 0
      i64.load8_u offset=8
      local.get 0
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 3
      i64.const 32
      i64.shl
      i64.or
      return
    end
    call $runtime.nilPanic
    unreachable)
  (func $main.handleRequest (type 6) (param i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 0
    i32.store offset=28
    local.get 1
    i64.const 2
    i64.store offset=20 align=4
    i32.const 66124
    i32.load
    local.set 4
    i32.const 66124
    local.get 1
    i32.const 16
    i32.add
    i32.store
    local.get 1
    local.get 4
    i32.store offset=16
    local.get 1
    i32.const 8
    i32.add
    i32.const 65784
    i32.const 11
    call $github.com/jcchavezs/http-wasm-tracing/guest/tinygo/handler.stringToPtr
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 1
    i32.load offset=8
    local.get 1
    i32.const 65795
    i32.const 1
    call $github.com/jcchavezs/http-wasm-tracing/guest/tinygo/handler.stringToPtr
    local.get 2
    local.get 1
    i32.load
    local.get 1
    i32.load offset=4
    call $set_span_attribute
    local.get 3
    i32.const 65888
    i32.eq
    local.get 3
    i32.const 65840
    i32.eq
    i32.or
    i32.eqz
    if  ;; label = @1
      call $runtime.nilPanic
      unreachable
    end
    i32.const 1
    i32.const 65796
    i32.const 5
    call $github.com/http-wasm/http-wasm-guest-tinygo/handler/internal/imports.writeBody
    i32.const 8
    call $runtime.alloc
    local.tee 2
    i32.const 5
    i32.store offset=4
    local.get 2
    i32.const 65796
    i32.store
    local.get 1
    local.get 2
    i32.store offset=24
    local.get 1
    local.get 2
    i32.store offset=28
    i32.const 66124
    local.get 4
    i32.store
    local.get 0
    i32.const 0
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.store8
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $handle_response (type 1) (param i32 i32))
  (func $github.com/jcchavezs/http-wasm-tracing/guest/tinygo/handler.stringToPtr (type 7) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 16
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i32.const 24
    i32.add
    i32.const 0
    i32.store
    local.get 3
    i64.const 0
    i64.store offset=8
    local.get 3
    i32.const 5
    i32.store offset=4
    i32.const 66124
    i32.load
    local.set 4
    i32.const 66124
    local.get 3
    i32.store
    local.get 3
    local.get 4
    i32.store
    local.get 2
    call $runtime.alloc
    local.tee 5
    local.get 1
    local.get 2
    memory.copy
    i32.const 66124
    local.get 4
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 5
    i32.store
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (table (;0;) 5 5 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 65536))
  (export "memory" (memory 0))
  (export "malloc" (func $malloc))
  (export "free" (func $free))
  (export "calloc" (func $calloc))
  (export "realloc" (func $realloc))
  (export "_start" (func $_start))
  (export "handle_request" (func $handle_request))
  (export "handle_response" (func $handle_response))
  (elem (;0;) (i32.const 1) func $main.handleRequest $github.com/http-wasm/http-wasm-guest-tinygo/handler.init$1 $runtime.memequal $runtime.hash32)
  (data $.rodata (i32.const 65536) "free: invalid pointer\00\00\00\00\00\01\00\15\00\00\00realloc: invalid pointer \00\01\00\18\00\00\00out of memorypanic: panic: runtime error: nil pointer dereferenceindex out of rangeslice out of rangegithub.com/http-wasm/http-wasm-guest-tinygo/handler\00\00\00\00\da\00\00\00\f0\00\01\00\d8\00\01")
  (data $.rodata.1 (i32.const 65776) "\d5\00\00\00\dc\00\01\00greeting_id1hello\00\00\00\fa\00\08\00X\01\01\00\dc\00\01\00\a5\00\01\00handler.wasmRequest\00\fa\00\05\00`\01\01\00\dc\00\01\00\a5\00\01\00handler.wasmResponse\00\00\00\00\d5\00\08\00\0c\01\01\00\d5\00\05\000\01\01")
  (data $.data (i32.const 65896) "/\a0Qp\a8\01\01\00\00\00\00\00T\02\01\00\c1\82\01\00\00\00\00\00\04\00\00\00\0c\00\00\00\01\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04"))
