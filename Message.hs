module Message where

import Database.Persist
import Model

fn1 :: Key User -> (Entity Muse, Entity Message, Entity Folder) -> IO ()
fn1 usr cluster =
  let (Entity museKey muse, Entity msgKey msg, Entity fldrKey fldr) = cluster
  in do
    print $ messageName msg
    print $ folderName fldr

fn2 :: Key User -> (Entity Muse, Entity Message, Entity Folder) -> IO ()
fn2 usr cluster =
  let (a, b, c) = cluster
      Entity museKey muse = a
      Entity msgKey msg = b
      Entity fldrKey fldr = c
  in do
    print $ messageName msg
    print $ folderName fldr
