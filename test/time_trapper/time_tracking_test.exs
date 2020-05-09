defmodule TimeTrapper.TimeTrackingTest do
  use TimeTrapper.DataCase

  alias TimeTrapper.TimeTracking

  describe "time_entries" do
    alias TimeTrapper.TimeTracking.TimeEntry

    @valid_attrs %{date: ~D[2010-04-17], minutes: 42, submitted: true}
    @update_attrs %{date: ~D[2011-05-18], minutes: 43, submitted: false}
    @invalid_attrs %{date: nil, minutes: nil, submitted: nil}

    def time_entry_fixture(attrs \\ %{}) do
      {:ok, time_entry} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TimeTracking.create_time_entry()

      time_entry
    end

    test "list_time_entries/0 returns all time_entries" do
      time_entry = time_entry_fixture()
      assert TimeTracking.list_time_entries() == [time_entry]
    end

    test "get_time_entry!/1 returns the time_entry with given id" do
      time_entry = time_entry_fixture()
      assert TimeTracking.get_time_entry!(time_entry.id) == time_entry
    end

    test "create_time_entry/1 with valid data creates a time_entry" do
      assert {:ok, %TimeEntry{} = time_entry} = TimeTracking.create_time_entry(@valid_attrs)
      assert time_entry.date == ~D[2010-04-17]
      assert time_entry.minutes == 42
      assert time_entry.submitted == true
    end

    test "create_time_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeTracking.create_time_entry(@invalid_attrs)
    end

    test "update_time_entry/2 with valid data updates the time_entry" do
      time_entry = time_entry_fixture()
      assert {:ok, %TimeEntry{} = time_entry} = TimeTracking.update_time_entry(time_entry, @update_attrs)
      assert time_entry.date == ~D[2011-05-18]
      assert time_entry.minutes == 43
      assert time_entry.submitted == false
    end

    test "update_time_entry/2 with invalid data returns error changeset" do
      time_entry = time_entry_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeTracking.update_time_entry(time_entry, @invalid_attrs)
      assert time_entry == TimeTracking.get_time_entry!(time_entry.id)
    end

    test "delete_time_entry/1 deletes the time_entry" do
      time_entry = time_entry_fixture()
      assert {:ok, %TimeEntry{}} = TimeTracking.delete_time_entry(time_entry)
      assert_raise Ecto.NoResultsError, fn -> TimeTracking.get_time_entry!(time_entry.id) end
    end

    test "change_time_entry/1 returns a time_entry changeset" do
      time_entry = time_entry_fixture()
      assert %Ecto.Changeset{} = TimeTracking.change_time_entry(time_entry)
    end
  end
end
