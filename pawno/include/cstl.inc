#if defined _cstl_inc
	#endinput
#endif
#define _cstl_inc
#pragma library cstl

#define VEC_ENTRY_TYPE_CELL 1
#define VEC_ENTRY_TYPE_ARRAY 2
#define VEC_ENTRY_TYPE_FLOAT 3

// DEQUE

native deque_swap(deqid1, id1, dequeid2, id2);

native deque_push_back(deqid, element); // push element
native deque_push_back_float(deqid, Float:element); // push element
native deque_push_back_arr(deqid, element[]); // push array

native deque_push_front(deqid, element); // push element
native deque_push_front_float(deqid, Float:element); // push element
native deque_push_front_arr(deqid, element[]); // push array

native deque_size(deqid); // get deque size

native deque_get(deqid, id); // get element
native Float:deque_get_float(deqid, id); // get floating point number
native deque_get_arr(deqid, id, buffer[], buflen); // get array element to buffer

native deque_set(deqid, id, element); // set cell
native deque_set_float(deqid, id, Float:element); // set cell
native deque_set_arr(deqid, id, element[]); // set array

native deque_clear(deqid); // clear deque
native deque_resize(deqid, newsize); // attention!: reducing size causes memory leaks if array pointers are removed

native deque_entry_type(deqid, id); // get element type
native deque_remove(deqid, id); // remove element by ID

native deque_find(deqid, element);  // find ID of int element
native deque_find_float(deqid, Float:element); // find ID of float element
native deque_find_arr(deqid, element[]); // find ID of array

native deque_globalize(deqid); // makes deque visible to all scripts
native deque_deglobalize(deqid); // deglobalizes deque (deque removed from all scripts except calling script)
native deque_is_globalized(deqid); // is deque ID globalized

native deque_index_exists(deqid, index); // does index exist

// VECTOR

native vector_push_back(vecid, element); // push element
native vector_push_back_float(vecid, Float:element); // push element
native vector_push_back_arr(vecid, element[]); // push array

native vector_size(vecid); // get vector size

native vector_get(vecid, id); // get element
native Float:vector_get_float(vecid, id); // get floating point number
native vector_get_arr(vecid, id, buffer[], buflen = sizeof buffer); // get array element to buffer

native vector_set(vecid, id, element); // set cell
native vector_set_float(vecid, id, Float:element); // set cell
native vector_set_arr(vecid, id, element[]); // set array

native vector_clear(vecid); // clear vector
native vector_resize(vecid, newsize); // attention!: reducing size causes memory leaks if array pointers are removed

native vector_entry_type(vecid, id); // get element type
native vector_remove(vecid, id); // remove element by ID

native vector_find(vecid, element);  // find ID of int element
native vector_find_float(vecid, Float:element); // find ID of float element
native vector_find_arr(vecid, element[]); // find ID of array

native vector_globalize(vecid); // makes vector visible to all scripts
native vector_deglobalize(vecid); // deglobalizes vector (vector removed from all scripts except calling script)
native vector_is_globalized(vecid); // is vector ID globalized

native vector_index_exists(vecid, index); // does index exist

// MAP

native map_insert(mapid, key[], value);
native map_insert_float(mapid, key[], Float:value);
native map_insert_arr(mapid, key[], value[]);

native map_get(mapid, key[]);
native Float:map_get_float(mapid, key[]);
native map_get_arr(mapid, key[], buffer[], buflen);

native map_size(mapid);
native map_remove(mapid, key[]);
native map_contains(mapid, key[]);
native map_entry_type(mapid, key[]);

native map_clear(mapid);

native map_globalize(mapid); // makes map visible to all scripts
native map_deglobalize(mapid); // deglobalizes map (map removed from all scripts except calling script)
native map_is_globalized(mapid); // is map ID globalized

