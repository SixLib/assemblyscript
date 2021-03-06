(module
 (type $_ (func))
 (type $iii (func (param i32 i32) (result i32)))
 (type $ii (func (param i32) (result i32)))
 (type $i_ (func (param i32)))
 (type $ii_ (func (param i32 i32)))
 (memory $0 0)
 (table $0 4 funcref)
 (elem (i32.const 0) $null $~lib/collector/itcm/__gc_mark $std/gc-object/Base~gc $std/gc-object/Custom~gc)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/collector/itcm/state (mut i32) (i32.const 0))
 (global $~lib/collector/itcm/white (mut i32) (i32.const 0))
 (global $~lib/collector/itcm/fromSpace (mut i32) (i32.const 0))
 (global $~lib/collector/itcm/toSpace (mut i32) (i32.const 0))
 (global $~lib/collector/itcm/iter (mut i32) (i32.const 0))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $std/gc-object/obj (mut i32) (i32.const 0))
 (global $~lib/started (mut i32) (i32.const 0))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 8))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "main" (func $std/gc-object/main))
 (func $start:~lib/allocator/arena (; 0 ;) (type $_)
  global.get $~lib/memory/HEAP_BASE
  i32.const 7
  i32.add
  i32.const 7
  i32.const -1
  i32.xor
  i32.and
  global.set $~lib/allocator/arena/startOffset
  global.get $~lib/allocator/arena/startOffset
  global.set $~lib/allocator/arena/offset
 )
 (func $~lib/allocator/arena/__memory_allocate (; 1 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.const 1073741824
  i32.gt_u
  if
   unreachable
  end
  global.get $~lib/allocator/arena/offset
  local.set $1
  local.get $1
  local.get $0
  local.tee $2
  i32.const 1
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.add
  i32.const 7
  i32.add
  i32.const 7
  i32.const -1
  i32.xor
  i32.and
  local.set $4
  current_memory
  local.set $5
  local.get $4
  local.get $5
  i32.const 16
  i32.shl
  i32.gt_u
  if
   local.get $4
   local.get $1
   i32.sub
   i32.const 65535
   i32.add
   i32.const 65535
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.shr_u
   local.set $2
   local.get $5
   local.tee $3
   local.get $2
   local.tee $6
   local.get $3
   local.get $6
   i32.gt_s
   select
   local.set $3
   local.get $3
   grow_memory
   i32.const 0
   i32.lt_s
   if
    local.get $2
    grow_memory
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $4
  global.set $~lib/allocator/arena/offset
  local.get $1
 )
 (func $~lib/collector/itcm/ManagedObjectList#clear (; 2 ;) (type $i_) (param $0 i32)
  local.get $0
  local.get $0
  i32.store
  local.get $0
  local.get $0
  i32.store offset=4
 )
 (func $~lib/collector/itcm/ManagedObject#get:color (; 3 ;) (type $ii) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.const 3
  i32.and
 )
 (func $~lib/collector/itcm/ManagedObject#get:next (; 4 ;) (type $ii) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
 )
 (func $~lib/collector/itcm/ManagedObject#set:next (; 5 ;) (type $ii_) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load
  i32.const 3
  i32.and
  i32.or
  i32.store
 )
 (func $~lib/collector/itcm/ManagedObject#unlink (; 6 ;) (type $i_) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/collector/itcm/ManagedObject#get:next
  local.set $1
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $1
  call $~lib/collector/itcm/ManagedObject#set:next
 )
 (func $~lib/collector/itcm/ManagedObjectList#push (; 7 ;) (type $ii_) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $1
  local.get $0
  call $~lib/collector/itcm/ManagedObject#set:next
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $1
  call $~lib/collector/itcm/ManagedObject#set:next
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $~lib/collector/itcm/ManagedObject#makeGray (; 8 ;) (type $i_) (param $0 i32)
  local.get $0
  global.get $~lib/collector/itcm/iter
  i32.eq
  if
   local.get $0
   i32.load offset=4
   global.set $~lib/collector/itcm/iter
  end
  local.get $0
  call $~lib/collector/itcm/ManagedObject#unlink
  global.get $~lib/collector/itcm/toSpace
  local.get $0
  call $~lib/collector/itcm/ManagedObjectList#push
  local.get $0
  local.get $0
  i32.load
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.const 2
  i32.or
  i32.store
 )
 (func $~lib/collector/itcm/__gc_mark (; 9 ;) (type $i_) (param $0 i32)
  (local $1 i32)
  local.get $0
  if
   block $~lib/collector/itcm/refToObj|inlined.0 (result i32)
    local.get $0
    local.set $1
    local.get $1
    i32.const 16
    i32.sub
   end
   local.set $1
   local.get $1
   call $~lib/collector/itcm/ManagedObject#get:color
   global.get $~lib/collector/itcm/white
   i32.eq
   if
    local.get $1
    call $~lib/collector/itcm/ManagedObject#makeGray
   end
  end
 )
 (func $~lib/collector/itcm/ManagedObject#set:color (; 10 ;) (type $ii_) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $1
  i32.or
  i32.store
 )
 (func $~lib/allocator/arena/__memory_free (; 11 ;) (type $i_) (param $0 i32)
  nop
 )
 (func $~lib/collector/itcm/step (; 12 ;) (type $_)
  (local $0 i32)
  (local $1 i32)
  block $break|0
   block $case3|0
    block $case2|0
     block $case1|0
      block $case0|0
       global.get $~lib/collector/itcm/state
       local.set $1
       local.get $1
       i32.const 0
       i32.eq
       br_if $case0|0
       local.get $1
       i32.const 1
       i32.eq
       br_if $case1|0
       local.get $1
       i32.const 2
       i32.eq
       br_if $case2|0
       local.get $1
       i32.const 3
       i32.eq
       br_if $case3|0
       br $break|0
      end
      block
       block $~lib/memory/memory.allocate|inlined.0 (result i32)
        i32.const 16
        local.set $1
        local.get $1
        call $~lib/allocator/arena/__memory_allocate
        br $~lib/memory/memory.allocate|inlined.0
       end
       global.set $~lib/collector/itcm/fromSpace
       global.get $~lib/collector/itcm/fromSpace
       i32.const -1
       i32.store offset=8
       global.get $~lib/collector/itcm/fromSpace
       call $~lib/collector/itcm/ManagedObjectList#clear
       block $~lib/memory/memory.allocate|inlined.1 (result i32)
        i32.const 16
        local.set $1
        local.get $1
        call $~lib/allocator/arena/__memory_allocate
        br $~lib/memory/memory.allocate|inlined.1
       end
       global.set $~lib/collector/itcm/toSpace
       global.get $~lib/collector/itcm/toSpace
       i32.const -1
       i32.store offset=8
       global.get $~lib/collector/itcm/toSpace
       call $~lib/collector/itcm/ManagedObjectList#clear
       global.get $~lib/collector/itcm/toSpace
       global.set $~lib/collector/itcm/iter
       i32.const 1
       global.set $~lib/collector/itcm/state
      end
     end
     block
      i32.const 1
      call $~iterateRoots
      i32.const 2
      global.set $~lib/collector/itcm/state
      br $break|0
      unreachable
     end
     unreachable
    end
    block
     global.get $~lib/collector/itcm/iter
     call $~lib/collector/itcm/ManagedObject#get:next
     local.set $0
     local.get $0
     global.get $~lib/collector/itcm/toSpace
     i32.ne
     if
      local.get $0
      global.set $~lib/collector/itcm/iter
      local.get $0
      global.get $~lib/collector/itcm/white
      i32.eqz
      call $~lib/collector/itcm/ManagedObject#set:color
      i32.const 1
      global.set $~lib/argc
      block $~lib/collector/itcm/objToRef|inlined.0 (result i32)
       local.get $0
       local.set $1
       local.get $1
       i32.const 16
       i32.add
      end
      local.get $0
      i32.load offset=8
      call_indirect (type $i_)
     else      
      i32.const 1
      call $~iterateRoots
      global.get $~lib/collector/itcm/iter
      call $~lib/collector/itcm/ManagedObject#get:next
      local.set $0
      local.get $0
      global.get $~lib/collector/itcm/toSpace
      i32.eq
      if
       global.get $~lib/collector/itcm/fromSpace
       local.set $1
       global.get $~lib/collector/itcm/toSpace
       global.set $~lib/collector/itcm/fromSpace
       local.get $1
       global.set $~lib/collector/itcm/toSpace
       global.get $~lib/collector/itcm/white
       i32.eqz
       global.set $~lib/collector/itcm/white
       local.get $1
       call $~lib/collector/itcm/ManagedObject#get:next
       global.set $~lib/collector/itcm/iter
       i32.const 3
       global.set $~lib/collector/itcm/state
      end
     end
     br $break|0
     unreachable
    end
    unreachable
   end
   block
    global.get $~lib/collector/itcm/iter
    local.set $0
    local.get $0
    global.get $~lib/collector/itcm/toSpace
    i32.ne
    if
     local.get $0
     call $~lib/collector/itcm/ManagedObject#get:next
     global.set $~lib/collector/itcm/iter
     local.get $0
     global.get $~lib/memory/HEAP_BASE
     i32.ge_u
     if
      block $~lib/memory/memory.free|inlined.0
       local.get $0
       local.set $1
       local.get $1
       call $~lib/allocator/arena/__memory_free
       br $~lib/memory/memory.free|inlined.0
      end
     end
    else     
     global.get $~lib/collector/itcm/toSpace
     call $~lib/collector/itcm/ManagedObjectList#clear
     i32.const 1
     global.set $~lib/collector/itcm/state
    end
    br $break|0
    unreachable
   end
   unreachable
  end
 )
 (func $~lib/collector/itcm/__gc_allocate (; 13 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 1073741824
  i32.const 16
  i32.sub
  i32.gt_u
  if
   unreachable
  end
  call $~lib/collector/itcm/step
  block $~lib/memory/memory.allocate|inlined.2 (result i32)
   i32.const 16
   local.get $0
   i32.add
   local.set $2
   local.get $2
   call $~lib/allocator/arena/__memory_allocate
   br $~lib/memory/memory.allocate|inlined.2
  end
  local.set $3
  local.get $3
  local.get $1
  i32.store offset=8
  local.get $3
  global.get $~lib/collector/itcm/white
  call $~lib/collector/itcm/ManagedObject#set:color
  global.get $~lib/collector/itcm/fromSpace
  local.get $3
  call $~lib/collector/itcm/ManagedObjectList#push
  block $~lib/collector/itcm/objToRef|inlined.1 (result i32)
   local.get $3
   local.set $2
   local.get $2
   i32.const 16
   i32.add
  end
 )
 (func $std/gc-object/Base~gc (; 14 ;) (type $i_) (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  call $~lib/collector/itcm/__gc_mark
 )
 (func $std/gc-object/Base#constructor (; 15 ;) (type $ii) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 0
   i32.const 2
   call $~lib/collector/itcm/__gc_allocate
   local.set $0
  end
  local.get $0
 )
 (func $std/gc-object/Custom~gc (; 16 ;) (type $i_) (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 2
  call_indirect (type $i_)
  local.get $0
  i32.load
  call $~lib/collector/itcm/__gc_mark
  local.get $0
  i32.load offset=4
  call $~lib/collector/itcm/__gc_mark
 )
 (func $std/gc-object/Custom#constructor (; 17 ;) (type $ii) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 8
   i32.const 3
   call $~lib/collector/itcm/__gc_allocate
   local.set $0
  end
  local.get $0
  call $std/gc-object/Base#constructor
  local.set $0
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
 )
 (func $~lib/collector/itcm/__gc_collect (; 18 ;) (type $_)
  (local $0 i32)
  block $break|0
   block $case1|0
    block $case0|0
     global.get $~lib/collector/itcm/state
     local.set $0
     local.get $0
     i32.const 0
     i32.eq
     br_if $case0|0
     local.get $0
     i32.const 1
     i32.eq
     br_if $case1|0
     br $break|0
    end
   end
   call $~lib/collector/itcm/step
  end
  block $break|1
   loop $continue|1
    global.get $~lib/collector/itcm/state
    i32.const 1
    i32.ne
    if
     call $~lib/collector/itcm/step
     br $continue|1
    end
   end
  end
 )
 (func $~lib/gc/gc.collect (; 19 ;) (type $_)
  call $~lib/collector/itcm/__gc_collect
  return
 )
 (func $start:std/gc-object (; 20 ;) (type $_)
  call $start:~lib/allocator/arena
  i32.const 0
  call $std/gc-object/Custom#constructor
  global.set $std/gc-object/obj
  call $~lib/gc/gc.collect
  global.get $std/gc-object/obj
  global.get $std/gc-object/obj
  i32.store
  call $~lib/gc/gc.collect
  i32.const 0
  global.set $std/gc-object/obj
  call $~lib/gc/gc.collect
 )
 (func $std/gc-object/main (; 21 ;) (type $_)
  global.get $~lib/started
  i32.eqz
  if
   call $start
   i32.const 1
   global.set $~lib/started
  end
 )
 (func $start (; 22 ;) (type $_)
  call $start:std/gc-object
 )
 (func $null (; 23 ;) (type $_)
 )
 (func $~iterateRoots (; 24 ;) (type $i_) (param $0 i32)
  global.get $std/gc-object/obj
  local.get $0
  call_indirect (type $i_)
 )
)
