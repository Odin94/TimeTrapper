defmodule TimeTrapperWeb.TimeEntryControllerTest do
  use TimeTrapperWeb.ConnCase

  alias TimeTrapper.TimeTracking

  @create_attrs %{date: ~D[2010-04-17], minutes: 42, submitted: true}
  @update_attrs %{date: ~D[2011-05-18], minutes: 43, submitted: false}
  @invalid_attrs %{date: nil, minutes: nil, submitted: nil}

  def fixture(:time_entry) do
    {:ok, time_entry} = TimeTracking.create_time_entry(@create_attrs)
    time_entry
  end

  describe "index" do
    test "lists all time_entries", %{conn: conn} do
      conn = get(conn, Routes.time_entry_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Time entries"
    end
  end

  describe "new time_entry" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.time_entry_path(conn, :new))
      assert html_response(conn, 200) =~ "New Time entry"
    end
  end

  describe "create time_entry" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.time_entry_path(conn, :create), time_entry: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.time_entry_path(conn, :show, id)

      conn = get(conn, Routes.time_entry_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Time entry"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.time_entry_path(conn, :create), time_entry: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Time entry"
    end
  end

  describe "edit time_entry" do
    setup [:create_time_entry]

    test "renders form for editing chosen time_entry", %{conn: conn, time_entry: time_entry} do
      conn = get(conn, Routes.time_entry_path(conn, :edit, time_entry))
      assert html_response(conn, 200) =~ "Edit Time entry"
    end
  end

  describe "update time_entry" do
    setup [:create_time_entry]

    test "redirects when data is valid", %{conn: conn, time_entry: time_entry} do
      conn = put(conn, Routes.time_entry_path(conn, :update, time_entry), time_entry: @update_attrs)
      assert redirected_to(conn) == Routes.time_entry_path(conn, :show, time_entry)

      conn = get(conn, Routes.time_entry_path(conn, :show, time_entry))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, time_entry: time_entry} do
      conn = put(conn, Routes.time_entry_path(conn, :update, time_entry), time_entry: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Time entry"
    end
  end

  describe "delete time_entry" do
    setup [:create_time_entry]

    test "deletes chosen time_entry", %{conn: conn, time_entry: time_entry} do
      conn = delete(conn, Routes.time_entry_path(conn, :delete, time_entry))
      assert redirected_to(conn) == Routes.time_entry_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.time_entry_path(conn, :show, time_entry))
      end
    end
  end

  defp create_time_entry(_) do
    time_entry = fixture(:time_entry)
    {:ok, time_entry: time_entry}
  end
end
